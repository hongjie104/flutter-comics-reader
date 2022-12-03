import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api.dart';
import '../../models/novel.dart';
import '../../utils/decrypt.dart';
import '../page_state.dart';

class NovelReader extends StatefulWidget {
  const NovelReader({super.key});

  @override
  NovelReaderState createState() => NovelReaderState();
}

class NovelReaderState extends FetchDataPageState<NovelReader> {
  @override
  String get title => context.read<CurNovel>().data!.name;

  @override
  bool get addWillPopScope => true;

  String _content = '';

  late int _page;

  late int _totalPage;

  @override
  void initState() {
    final novel = context.read<CurNovel>().data!;
    _page = novel.readedPage;
    _totalPage = novel.lastPageIndex - novel.firstPageIndex + 1;
    super.initState();
  }

  @override
  Future fetchData([bool isFristTime = true]) async {
    final novel = context.read<CurNovel>().data!;
    final html = await API().getNovelPageContent(
      id: novel.id,
      pageIndex: novel.firstPageIndex + _page,
    );
    if (html != null) {
      String? content =
          RegExp(r'var chapter = secret\(".*",').stringMatch(html);
      if (content != null) {
        content = content
            .replaceFirst('var chapter = secret("', '')
            .replaceFirst('",', '');
      }
      String? code = RegExp(r"'[0-9a-z]{32}', true").stringMatch(html);
      if (code != null) {
        code = code.replaceAll("'", '').replaceFirst(', true', '');
      }
      if (content != null && code != null) {
        _content = decryptAESCryptoJS(content, code).replaceAll('<br />', '\n');
      }
    }
    return Future.value(true);
  }

  @override
  Widget buildFetchedBody({data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: SingleChildScrollView(
              child: Text(_content),
            ),
          ),
          Positioned(
              bottom: 2,
              right: 8,
              child: Row(
                children: [
                  Text('${_page + 1}/$_totalPage'),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: _onPrev,
                    child: const Text('上一章'),
                  ),
                  TextButton(
                    onPressed: _onNext,
                    child: const Text('下一章'),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  Future<bool> onWillPop() {
    final data = context.read<CurNovel>();
    data.setReadedPage(_page);
    context.read<NovelFavorites>().setReadedPage(data.data!.id, _page);
    return Future.value(true);
  }

  void _onPrev() {
    if (_page < 1) return;
    _page -= 1;
    refresh();
  }

  void _onNext() {
    if (_page < _totalPage) {
      _page += 1;
      refresh();
    }
  }
}

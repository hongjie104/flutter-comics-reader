import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart' show parse;
import 'package:provider/provider.dart';

import '../../api.dart';
import '../../components/input.dart';
import '../../global.dart';
import '../../models/novel.dart';
import '../../routes.dart';
import '../../utils/chinese.dart';
import '../page_state.dart';

class NovelSearchPage extends StatefulWidget {
  const NovelSearchPage({super.key});

  @override
  NovelSearchPageState createState() => NovelSearchPageState();
}

class NovelSearchPageState extends RefreshPageState<NovelSearchPage> {
  @override
  String get title => "搜索";

  final TextEditingController _textEditingController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final FocusScopeNode _scopeNode = FocusScopeNode();

  final List<NovelData> _dataList = [];

  int _page = 1;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
    _scopeNode.dispose();
  }

  @override
  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: FocusScope(
        node: _scopeNode,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              Input(
                ctl: _textEditingController,
                action: TextInputAction.search,
                keyboardType: TextInputType.text,
                borderRadius: 8.0,
                scopeNode: _scopeNode,
                hintText: '请输入关键字!',
                onSubmitted: _onSearch,
                suffix: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _textEditingController.text = convertToTraditionalChinese(
                      _textEditingController.text,
                    );
                  },
                  child: const Icon(Icons.change_circle),
                ),
              ),
              Expanded(
                child: EasyRefresh(
                  controller: controller,
                  scrollController: _scrollController,
                  header: buildRefreshHeader(),
                  footer: buildRefreshFooter(),
                  onRefresh: onRefresh,
                  onLoad: onLoad,
                  child: buildChild(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildChild() => ListView.separated(
        itemBuilder: (context, index) => index >= 0 && index < _dataList.length
            ? _NovelListTile(data: _dataList[index])
            : const SizedBox(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: _dataList.length,
      );

  @override
  Future<void> onRefresh() async {
    final key = _textEditingController.text;
    if (key.isEmpty) return;
    setState(() {
      _dataList.clear();
    });
    await _search(key, _page);
    if (!mounted) {
      return;
    }
    if (_scrollController.hasClients) _scrollController.jumpTo(0);
    setState(() {
      _page = 1;
    });
    controller.finishRefresh();
    controller.resetFooter();
  }

  @override
  Future<void> onLoad() async {
    final key = _textEditingController.text;
    if (key.isEmpty) return;
    await _search(key, _page + 1);
    if (!mounted) {
      return;
    }
    setState(() {
      _page += 1;
    });
    controller.finishLoad(IndicatorResult.success);
  }

  Future<void> _search(String key, int page) async {
    final html = await API().searchNovel(key, page);
    if (html != null) {
      final Document document = parse(html);
      document.querySelectorAll('div.common-bookele').forEach((div) {
        final a = div.querySelector('a.articlename')!;
        _dataList.add(NovelData(
          id: a.attributes['href']!
              .replaceFirst('/novel/', '')
              .replaceFirst('.html', ''),
          name: a.text,
          author: div.querySelector('strong')!.text,
          des: div.querySelector('span.abstract')!.text.replaceAll('\n', ''),
        ));
      });
    }
  }

  void _onSearch(String keyword) async {
    FocusManager.instance.primaryFocus?.unfocus();
    onRefresh();
  }
}

class _NovelListTile extends StatelessWidget {
  final NovelData data;
  const _NovelListTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Row(
        children: [
          Expanded(
            child:
                Text(data.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Text(
            '作者:${data.author}',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff666666),
            ),
          ),
        ],
      ),
      subtitle: Text(data.des),
      onTap: () {
        context.read<CurNovel>().data = data;
        context.push(Routes.novelDetail);
      },
    );
  }
}

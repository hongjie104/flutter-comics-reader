import 'package:flutter/material.dart' hide Element;
import 'package:go_router/go_router.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart' show parse;
import 'package:provider/provider.dart';

import '../../api.dart';
import '../../models/novel.dart';
import '../../routes.dart';
import '../page_state.dart';

class NovelDetailPage extends StatefulWidget {
  const NovelDetailPage({super.key});

  @override
  NovelDetailPageState createState() => NovelDetailPageState();
}

class NovelDetailPageState extends FetchDataPageState<NovelDetailPage> {
  @override
  String get title => context.read<CurNovel>().data!.name;

  String _des = '';

  @override
  Future fetchData([bool isFristTime = true]) async {
    final novel = context.read<CurNovel>();
    if (novel.data != null) {
      final html = await API().getNovelDetail(id: novel.data!.id);
      if (!mounted) return;
      if (html != null) {
        final Document document = parse(html);
        String? des = "";
        document.querySelectorAll('meta').forEach((element) {
          if (element.attributes['name'] == 'description') {
            des = element.attributes['content'];
          }
        });
        if (des != null) _des = des!;
        int firstPageIndex = 0;
        int lastPageIndex = 0;
        // document.querySelectorAll('div.chapterList a').forEach((a) {
        //   if (a.attributes['title'] == '分卷阅读1') {
        //     firstPageIndex = int.parse(a.attributes['href']!
        //         .replaceFirst('/novel/${novel.data!.id}/', '')
        //         .replaceFirst('.html', ''));
        //   }
        // });
        final ul = document.querySelector('div.chapterList>ul');
        if (ul != null) {
          List<Element> aList = ul.querySelectorAll('li>a');
          firstPageIndex = int.parse(aList[0]
              .attributes['href']!
              .replaceFirst('/novel/${novel.data!.id}/', '')
              .replaceFirst('.html', ''));
          lastPageIndex = int.parse(aList[aList.length - 1]
              .attributes['href']!
              .replaceFirst('/novel/${novel.data!.id}/', '')
              .replaceFirst('.html', ''));
        }
        String? token = RegExp(r'token/[a-z0-9]+/').stringMatch(html);
        if (token != null) {
          token = token.replaceFirst('token', '').replaceAll('/', '');
          final info =
              await API().getNovelInfo(id: novel.data!.id, token: token);
          if (info != null) {
            novel.updateInfo(
              int.parse(info['dayvisit']),
              int.parse(info['weekvisit']),
              int.parse(info['allvisit']),
              int.parse(info['lastupdate']),
              int.parse(info['size']),
              firstPageIndex,
              lastPageIndex,
            );
            return Future.value(true);
          }
        }
      }
    }
  }

  @override
  Widget buildFetchedBody({data}) {
    final novel = context.watch<CurNovel>().data!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildInfo('作者', novel.author, '字数', novel.size.toString()),
          _buildInfo(
            '日点击',
            novel.dayVisit.toString(),
            '周点击',
            novel.weekVisit.toString(),
          ),
          _buildInfo(
            '总点击',
            novel.allVisit.toString(),
            '更新时间',
            '${novel.updateAt!.year}-${novel.updateAt!.month}-${novel.updateAt!.day}',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: _onFavorite,
                child: context.watch<NovelFavorites>().isFavorted(novel.id)
                    ? const Text('取消收藏')
                    : const Text('加入收藏'),
              ),
              TextButton(
                onPressed: _onStart,
                child: const Text('开始阅读'),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_des),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String key1, String val1, String key2, String val2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$key1:$val1'),
          Text('$key2:$val2'),
        ],
      );

  void _onFavorite() {
    final data = context.read<CurNovel>().data!;
    var f = context.read<NovelFavorites>();
    if (f.isFavorted(data.id)) {
      f.remove(data.id);
    } else {
      f.add(data);
    }
  }

  void _onStart() {
    context.push(Routes.novelReader);
  }
}

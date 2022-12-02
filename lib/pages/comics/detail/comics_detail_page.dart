import 'package:comics_reader/global.dart';
import 'package:comics_reader/api.dart';
import 'package:comics_reader/models/custom_theme.dart';
import 'package:comics_reader/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libra/flutter_libra.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/comics.dart';
import '../../page_state.dart';

class ComicsDetailPage extends StatefulWidget {
  const ComicsDetailPage({super.key});

  @override
  ComicsDetailPageState createState() => ComicsDetailPageState();
}

class ComicsDetailPageState extends FetchDataPageState<ComicsDetailPage> {
  @override
  String get title => context.read<CurComics>().data!.title;

  @override
  Widget buildFetchedBody({data}) {
    final comics = context.watch<CurComics>().data!;
    final curTheme = context.watch<CurTheme>().curTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedImage(
                  imageUrl: comics.coverImageUrl,
                  width: 240.w,
                  height: 320.w,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.category, color: curTheme.primaryColor),
                          Text(
                            comics.category!,
                            style: TextStyle(color: curTheme.primaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.pages, color: curTheme.primaryColor),
                          Text(
                            '${comics.numImage}P',
                            style: TextStyle(color: curTheme.primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: _onFavorite,
                            child: context
                                    .watch<ComicsFavorites>()
                                    .isFavorted(comics.id)
                                ? const Text('取消收藏')
                                : const Text('加入收藏'),
                          ),
                          TextButton(
                            onPressed: _onStart,
                            child: const Text('开始阅读'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(comics.des!),
          ),
        ],
      ),
    );
  }

  @override
  Future fetchData([bool isFristTime = true]) async {
    final data = await API().getKoreanMangaDetail(
      context.read<CurComics>().data!,
    );
    return Future.value(data);
  }

  Future<void> _onStart() async {
    final data = context.read<CurComics>().data!;
    if (data.imgUrlList == null || data.imgUrlList!.isEmpty) {
      data.imgUrlList = await API().getKoreanMangaImages(
        '/photos-slidelow-aid-${data.id}.html',
      );
    }
    if (mounted) {
      Global.router.navigateTo(context, Routes.comicsReader);
    }
  }

  void _onFavorite() {
    final data = context.read<CurComics>().data!;
    var f = context.read<ComicsFavorites>();
    if (f.isFavorted(data.id)) {
      f.remove(data.id);
    } else {
      f.add(data);
    }
  }
}

import 'package:comics_reader/components/cached_image.dart';
import 'package:comics_reader/global.dart';
import 'package:comics_reader/api.dart';
import 'package:comics_reader/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/comics.dart';
import '../page_state.dart';

class ComicsDetailPage extends StatefulWidget {
  final ComicsData comicsData;
  const ComicsDetailPage({super.key, required this.comicsData});

  @override
  ComicsDetailPageState createState() => ComicsDetailPageState();
}

class ComicsDetailPageState extends FetchDataPageState<ComicsDetailPage> {
  @override
  String get title => widget.comicsData.title;

  @override
  Widget buildFetchedBody({data}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blue.shade200,
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedImage(
                  imageUrl: widget.comicsData.coverImageUrl,
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
                          const Icon(Icons.category),
                          Text(widget.comicsData.category!),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.pages),
                          Text('${widget.comicsData.numImage}P'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: _onFavorite,
                            child: context
                                    .watch<Favorites>()
                                    .isFavorted(widget.comicsData.id)
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
            child: Text(widget.comicsData.des!),
          ),
        ],
      ),
    );
  }

  @override
  Future fetchData([bool isFristTime = true]) async {
    final data = await API().getKoreanMangaDetail(widget.comicsData);
    return Future.value(data);
  }

  Future<void> _onStart() async {
    if (widget.comicsData.imgUrlList == null ||
        widget.comicsData.imgUrlList!.isEmpty) {
      widget.comicsData.imgUrlList = await API().getKoreanMangaImages(
        '/photos-slidelow-aid-${widget.comicsData.id}.html',
      );
    }
    if (mounted) {
      Global.router.navigateTo(
        context,
        Routes.comicsReader,
        routeSettings: RouteSettings(arguments: widget.comicsData),
      );
    }
  }

  void _onFavorite() {
    var f = context.read<Favorites>();
    if (f.isFavorted(widget.comicsData.id)) {
      f.remove(widget.comicsData.id);
    } else {
      f.add(widget.comicsData);
    }
  }
}

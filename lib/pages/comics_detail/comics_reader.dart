import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libra/flutter_libra.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/comics.dart';
import '../page_state.dart';

class ComicsReader extends StatefulWidget {
  final ComicsData comicsData;
  const ComicsReader({super.key, required this.comicsData});

  @override
  ComicsReaderState createState() => ComicsReaderState();
}

class ComicsReaderState extends BasePageState<ComicsReader> {
  late PageController _pageController;

  /// 每页显示多少张图片
  final _numImgPerPage = 10;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.comicsData.readedPage ~/ _numImgPerPage,
      keepPage: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  PreferredSizeWidget? buildHeader(
          {List<Widget>? actions,
          PreferredSizeWidget? bottom,
          IconThemeData? iconTheme,
          Widget? leading}) =>
      null;

  @override
  Widget buildBody() {
    return PageView.builder(
      itemBuilder: _buildItem,
      onPageChanged: _onPageChange,
      itemCount:
          (widget.comicsData.imgUrlList!.length / _numImgPerPage).round(),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = index * _numImgPerPage;
              i < index * _numImgPerPage + _numImgPerPage;
              i++)
            if (i < widget.comicsData.imgUrlList!.length)
              CachedImage(
                imageUrl: widget.comicsData.imgUrlList![i],
                width: 750.w,
              ),
        ],
      ),
    );
  }

  void _onPageChange(int page) {
    if (kDebugMode) print(page);
    context
        .read<Favorites>()
        .setReadedPage(widget.comicsData.id, page * _numImgPerPage);
  }
}

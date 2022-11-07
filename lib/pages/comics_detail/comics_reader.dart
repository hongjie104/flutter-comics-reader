import 'package:comics_reader/components/cached_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.comicsData.readedPage,
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
      itemCount: widget.comicsData.imgUrlList!.length,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return SingleChildScrollView(
      child: CachedImage(
        imageUrl: widget.comicsData.imgUrlList![index],
        width: 750.w,
      ),
    );
  }

  void _onPageChange(int page) {
    if (kDebugMode) print(page);
    context.read<Favorites>().setReadedPage(widget.comicsData.id, page);
  }
}
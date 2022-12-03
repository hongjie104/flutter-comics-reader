import 'package:flutter/material.dart';
import 'package:flutter_libra/flutter_libra.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/comics.dart';
import '../page_state.dart';

class ComicsReader extends StatefulWidget {
  const ComicsReader({super.key});

  @override
  ComicsReaderState createState() => ComicsReaderState();
}

class ComicsReaderState extends BasePageState<ComicsReader> {
  @override
  bool get addWillPopScope => true;

  late PageController _pageController;

  /// 每页显示多少张图片
  final _numImgPerPage = 10;

  int _page = 0;

  int _totalPage = 0;

  late Offset _offset;

  @override
  void initState() {
    super.initState();
    final data = context.read<CurComics>().data!;
    _offset = Offset(
      ScreenUtil().screenWidth - 32,
      ScreenUtil().screenHeight - 32,
    );
    _page = data.readedPage;
    if (_page < 0) _page = 0;
    _totalPage = (data.imgUrlList!.length / _numImgPerPage).round();
    _pageController = PageController(
      initialPage: _page,
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
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemBuilder: _buildItem,
          onPageChanged: _onPageChange,
          itemCount: _totalPage,
        ),
        Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset = _calOffset(
                  MediaQuery.of(context).size,
                  _offset,
                  details.delta,
                );
              });
            },
            onPanEnd: (details) {},
            onTap: _showBottomDialog,
            child: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = context.read<CurComics>().data!;
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = index * _numImgPerPage;
              i < index * _numImgPerPage + _numImgPerPage;
              i++)
            if (i < data.imgUrlList!.length)
              CachedImage(
                imageUrl: data.imgUrlList![i],
                width: 750.w,
              ),
        ],
      ),
    );
  }

  @override
  Future<bool> onWillPop() {
    final data = context.read<CurComics>();
    data.setReadedPage(_page);
    context.read<ComicsFavorites>().setReadedPage(data.data!.id, _page);
    return Future.value(true);
  }

  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
    const gap = 32;
    double dx = 0;
    // 水平方向偏移量不能小于0不能大于屏幕最大宽度
    if (offset.dx + nextOffset.dx <= 0) {
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - gap)) {
      dx = size.width - gap;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    // 垂直方向偏移量不能小于0不能大于屏幕最大高度
    if (offset.dy + nextOffset.dy >= (size.height - gap)) {
      dy = size.height - gap;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(dx, dy);
  }

  void _onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  void _showBottomDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) => StatefulBuilder(builder: (_, StateSetter state) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.w),
          child: Slider(
            value: _page * 1.0 + 1,
            min: 1,
            max: _totalPage * 1.0,
            onChanged: (newValue) {
              state(() {
                _page = newValue.round() - 1;
              });
              _pageController.jumpToPage(_page);
            },
            label: '${_page + 1}/$_totalPage',
            divisions: _totalPage - 1,
            semanticFormatterCallback: (newValue) {
              return '跳转到第${newValue.round() + 1}页';
            },
          ),
        );
      }),
    );
  }
}

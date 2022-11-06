import 'package:comics_reader/components/cached_image.dart';
import 'package:comics_reader/global.dart';
import 'package:comics_reader/provider.dart';
import 'package:comics_reader/routes.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../page_state.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends RefreshPageState<IndexPage> {
  @override
  String get title => "IndexPage";

  final _pageSize = 20;

  final List<CoverData> _dataList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody() {
    return EasyRefresh(
      refreshOnStart: true,
      controller: controller,
      header: buildRefreshHeader(),
      footer: buildRefreshFooter(),
      onRefresh: onRefresh,
      onLoad: onLoad,
      child: buildChild(),
    );
  }

  @override
  Widget buildChild() {
    // 每行2个
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              _buildChild(index << 1),
              SizedBox(width: 8.w),
              _buildChild((index << 1) + 1),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.w),
        itemCount: (_dataList.length / 2).round(),
      ),
    );
  }

  Widget _buildChild(int index) {
    final data = _dataList[index];
    return SizedBox(
      width: 330.w,
      height: 536.w,
      child: GestureDetector(
        onTap: () {
          Global.router.navigateTo(
            context,
            Routes.comicsDetail,
            routeSettings: RouteSettings(arguments: data),
          );
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedImage(
                imageUrl: data.coverImageUrl,
                width: 330.w,
                height: 440.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${data.title}-${data.numImage}张图片',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Future<void> onRefresh() async {
    final dataList = await Provider().getKoreanManga(1, _pageSize);
    if (!mounted) {
      return;
    }
    _dataList.clear();
    if (dataList != null) {
      if (dataList.isNotEmpty) {
        setState(() {
          _dataList.addAll(dataList);
          page = 1;
        });
      }
    }
    controller.finishRefresh();
    controller.resetFooter();
  }

  @override
  Future<void> onLoad() async {
    final dataList = await Provider().getKoreanManga(page + 1, _pageSize);
    if (!mounted) {
      return;
    }
    if (dataList != null) {
      if (dataList.isNotEmpty) {
        setState(() {
          _dataList.addAll(dataList);
          page += 1;
        });
        controller.finishLoad(IndicatorResult.success);
      } else {
        controller.finishLoad(IndicatorResult.noMore);
      }
    }
  }
}

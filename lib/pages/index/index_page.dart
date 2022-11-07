import 'package:comics_reader/global.dart';
import 'package:comics_reader/api.dart';
import 'package:comics_reader/routes.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/comics.dart';
import '../page_state.dart';
import 'comics_card.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends RefreshPageState<IndexPage> {
  @override
  String get title => "IndexPage";

  final _pageSize = 20;

  final List<ComicsData> _dataList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  PreferredSizeWidget? buildHeader(
      {List<Widget>? actions,
      PreferredSizeWidget? bottom,
      IconThemeData? iconTheme,
      Widget? leading}) {
    return super.buildHeader(
      actions: [
        IconButton(onPressed: _onSearch, icon: const Icon(Icons.search)),
      ],
    );
  }

  @override
  Widget? buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        Global.router.navigateTo(context, Routes.favorites);
      },
      child: const Icon(Icons.favorite),
    );
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
              ComicsCard(data: _dataList[index << 1]),
              SizedBox(width: 8.w),
              if ((index << 1) + 1 < _dataList.length)
                ComicsCard(data: _dataList[(index << 1) + 1]),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.w),
        itemCount: (_dataList.length / 2).round(),
      ),
    );
  }

  @override
  Future<void> onRefresh() async {
    final dataList = await API().getKoreanManga(1, _pageSize);
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
    final dataList = await API().getKoreanManga(page + 1, _pageSize);
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

  void _onSearch() {
    Global.router.navigateTo(context, Routes.search);
  }
}

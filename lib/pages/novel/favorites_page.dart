import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/novel.dart';
import '../page_state.dart';
import 'novel_list_tile.dart';

class NovelFavoritesPage extends StatefulWidget {
  const NovelFavoritesPage({super.key});

  @override
  NovelFavoritesPageState createState() => NovelFavoritesPageState();
}

class NovelFavoritesPageState extends BasePageState<NovelFavoritesPage> {
  @override
  String get title => "收藏";

  @override
  bool get wantKeepAlive => true;

  @override
  Widget buildBody() {
    final dataList = context.watch<NovelFavorites>().dataList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return NovelListTile(data: dataList[index]);
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.w),
        itemCount: (dataList.length / 2).round(),
      ),
    );
  }
}

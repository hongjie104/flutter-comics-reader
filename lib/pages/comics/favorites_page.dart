import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/comics.dart';
import '../page_state.dart';
import 'comics_card.dart';

class ComicsFavoritesPage extends StatefulWidget {
  const ComicsFavoritesPage({super.key});

  @override
  ComicsFavoritesPageState createState() => ComicsFavoritesPageState();
}

class ComicsFavoritesPageState extends BasePageState<ComicsFavoritesPage> {
  @override
  String get title => "收藏";

  @override
  bool get wantKeepAlive => true;

  @override
  Widget buildBody() {
    final dataList = context.watch<ComicsFavorites>().dataList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              ComicsCard(data: dataList[index << 1]),
              SizedBox(width: 8.w),
              if ((index << 1) + 1 < dataList.length)
                ComicsCard(data: dataList[(index << 1) + 1]),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.w),
        itemCount: (dataList.length / 2).round(),
      ),
    );
  }
}

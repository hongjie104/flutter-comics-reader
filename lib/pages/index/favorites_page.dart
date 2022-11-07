import 'package:comics_reader/models/comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../page_state.dart';
import 'comics_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends BasePageState<FavoritesPage> {
  @override
  String get title => "FavoritesPage";

  @override
  Widget buildBody() {
    final dataList = context.watch<Favorites>().dataList;
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

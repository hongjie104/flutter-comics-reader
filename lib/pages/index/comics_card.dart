import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/cached_image.dart';
import '../../global.dart';
import '../../models/comics.dart';
import '../../routes.dart';

class ComicsCard extends StatelessWidget {
  final ComicsData data;
  const ComicsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 536.w,
      child: GestureDetector(
        onTap: () {
          _onTap(context);
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

  void _onTap(BuildContext context) {
    Global.router.navigateTo(
      context,
      Routes.comicsDetail,
      routeSettings: RouteSettings(arguments: data),
    );
  }
}

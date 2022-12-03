import 'package:comics_reader/global.dart';
import 'package:comics_reader/models/novel.dart';
import 'package:comics_reader/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NovelListTile extends StatelessWidget {
  final NovelData data;
  const NovelListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(data.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Row(
        children: [
          Text('作者:${data.author}'),
          const Spacer(),
          const Icon(Icons.remove_red_eye, size: 16),
          const SizedBox(width: 4),
          Text(data.allVisit.toString()),
          const SizedBox(width: 8),
          Text(
            '更新时间:${data.updateAt.year}-${data.updateAt.month}-${data.updateAt.day}',
          ),
        ],
      ),
      onTap: () {
        context.read<CurNovel>().data = data;
        Global.router.navigateTo(context, Routes.novelDetail);
      },
    );
  }
}

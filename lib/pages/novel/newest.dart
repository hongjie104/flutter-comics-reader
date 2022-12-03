import 'package:flutter/material.dart';

import '../../api.dart';
import '../../global.dart';
import '../../models/novel.dart';
import '../page_state.dart';
import 'novel_list_tile.dart';

class Newest extends StatefulWidget {
  const Newest({super.key});

  @override
  State<Newest> createState() => _NewestState();
}

class _NewestState extends FetchDataPageState<Newest> {
  @override
  bool get wantKeepAlive => true;

  @override
  Color get pageColor => const Color(0xffececec);

  final List<NovelData> _dataList = [];

  @override
  Future fetchData([bool isFristTime = true]) async {
    if (Global.novelDecryptCode.isEmpty) {
      Global.novelDecryptCode = await API().getNovelHome();
    }
    final data = await API().getNewestNovel();
    if (data != null) {
      final List? dataList = data['data'];
      if (dataList != null) {
        _dataList.clear();
        for (var i in dataList) {
          _dataList.add(NovelData.fromJson(i, Global.novelDecryptCode));
        }
      }
    }
    return Future.value(data);
  }

  @override
  PreferredSizeWidget? buildHeader(
          {List<Widget>? actions,
          PreferredSizeWidget? bottom,
          IconThemeData? iconTheme,
          Widget? leading}) =>
      null;

  @override
  Widget buildFetchedBody({data}) {
    return ListView.separated(
      itemCount: _dataList.length,
      itemBuilder: _buildItem,
      separatorBuilder: (context, index) => const SizedBox(height: 1),
    );
  }

  Widget _buildItem(BuildContext context, int index) =>
      NovelListTile(data: _dataList[index]);
}

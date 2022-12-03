import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api.dart';
import '../../global.dart';
import '../../models/custom_theme.dart';
import '../../models/novel.dart';
import '../page_state.dart';
import 'novel_list_tile.dart';

/// 小说榜单
class NovelRank extends StatefulWidget {
  const NovelRank({super.key});

  @override
  State<NovelRank> createState() => _NovelRankState();
}

class _NovelRankState extends FetchDataPageState<NovelRank> {
  @override
  bool get wantKeepAlive => true;

  @override
  Color get pageColor => const Color(0xffececec);

  final List<NovelData> _todayDataList = [];
  final List<NovelData> _weekDataList = [];
  final List<NovelData> _monthDataList = [];
  final List<NovelData> _allDataList = [];

  int _numToday = 0;
  int _numWeek = 0;
  int _numMonth = 0;
  int _numAll = 0;

  @override
  Future fetchData([bool isFristTime = true]) async {
    if (Global.novelDecryptCode.isEmpty) {
      Global.novelDecryptCode = await API().getNovelHome();
    }
    await _fetchRankData('today', _todayDataList);
    await _fetchRankData('week', _weekDataList);
    await _fetchRankData('month', _monthDataList);
    await _fetchRankData('all', _allDataList);
    _numToday = _todayDataList.length;
    _numWeek = _weekDataList.length;
    _numMonth = _monthDataList.length;
    _numAll = _allDataList.length;
    return Future.value(true);
  }

  Future<void> _fetchRankData(String type, List<NovelData> dataList) async {
    var data = await API().getRankNovel(type, 10);
    if (data != null) {
      final List? list = data['data'];
      if (list != null) {
        for (var i in list) {
          dataList.add(NovelData.fromJson(i, Global.novelDecryptCode));
        }
      }
    }
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
    return StickyHeader(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: _numToday + _numWeek + _numMonth + _numAll + 4,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) {
      return _buildStickyHeader(index, '今日热榜');
    } else if (index <= _numToday) {
      return NovelListTile(data: _todayDataList[index - 1]);
    } else if (index == _numToday + 1) {
      return _buildStickyHeader(index, '本周热榜');
    } else if (index <= _numToday + _numWeek + 1) {
      return NovelListTile(data: _weekDataList[index - 2 - _numToday]);
    } else if (index == _numToday + _numWeek + 2) {
      return _buildStickyHeader(index, '本月热榜');
    } else if (index <= _numToday + _numWeek + _numMonth + 2) {
      return NovelListTile(
        data: _monthDataList[index - 3 - _numToday - _numWeek],
      );
    } else if (index == _numToday + _numWeek + _numMonth + 3) {
      return _buildStickyHeader(index, '总热榜');
    } else {
      return NovelListTile(
        data: _allDataList[index - 4 - _numToday - _numWeek - _numMonth],
      );
    }
  }

  Widget _buildStickyHeader(int index, String label) => StickyContainerWidget(
        index: index,
        child: Container(
          color: context.watch<CurTheme>().curTheme.secondColor,
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}

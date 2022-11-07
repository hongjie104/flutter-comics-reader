import 'package:comics_reader/api.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/input.dart';
import '../../models/comics.dart';
import '../../utils/chinese.dart';
import '../page_state.dart';
import 'comics_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends RefreshPageState<SearchPage> {
  @override
  String get title => "SearchPage";

  final TextEditingController _textEditingController = TextEditingController();

  final FocusScopeNode _scopeNode = FocusScopeNode();

  List<ComicsData> _dataList = [];

  int _page = 1;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scopeNode.dispose();
  }

  @override
  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: FocusScope(
        node: _scopeNode,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              Input(
                ctl: _textEditingController,
                action: TextInputAction.search,
                keyboardType: TextInputType.text,
                borderRadius: 8.0,
                scopeNode: _scopeNode,
                hintText: 'please input key word!',
                onSubmitted: _onSearch,
                suffix: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _textEditingController.text = convertToTraditionalChinese(
                      _textEditingController.text,
                    );
                  },
                  child: const Icon(Icons.change_circle),
                ),
              ),
              Expanded(
                child: EasyRefresh(
                  controller: controller,
                  header: buildRefreshHeader(),
                  footer: buildRefreshFooter(),
                  onRefresh: onRefresh,
                  onLoad: onLoad,
                  child: buildChild(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildChild() => Padding(
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

  @override
  Future<void> onRefresh() async {
    final key = _textEditingController.text;
    if (key.isEmpty) return;
    final data = await API().search(key, 1);
    if (!mounted) {
      return;
    }
    setState(() {
      _page = 1;
      _dataList = data.list;
    });
    controller.finishRefresh();
    controller.resetFooter();
  }

  @override
  Future<void> onLoad() async {
    final key = _textEditingController.text;
    if (key.isEmpty) return;
    final data = await API().search(key, 1 + _page);
    if (!mounted) {
      return;
    }
    setState(() {
      _page += 1;
      _dataList.addAll(data.list);
    });
    controller.finishLoad(_dataList.length >= data.total
        ? IndicatorResult.noMore
        : IndicatorResult.success);
  }

  void _onSearch(String keyword) async {
    FocusManager.instance.primaryFocus?.unfocus();
    onRefresh();
  }
}

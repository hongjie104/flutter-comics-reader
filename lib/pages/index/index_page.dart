import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../models/custom_theme.dart';
import '../novel/novel_page.dart';
import '../page_state.dart';
import '../comics/comics_page.dart';
import '../setting/setting_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends BasePageState<IndexPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get addWillPopScope => true;

  int _pageIdx = 0;

  // 上次点击时间
  DateTime? _lastPressedAt;

  final List<Widget> _pages = const [
    ComicsPage(),
    NovelPage(),
    SettingPage(),
  ];

  final PageController _controller = PageController(keepPage: true);

  @override
  PreferredSizeWidget? buildHeader(
          {List<Widget>? actions,
          PreferredSizeWidget? bottom,
          IconThemeData? iconTheme,
          Widget? leading}) =>
      null;

  @override
  Widget buildBody() {
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        setState(() {
          _pageIdx = index;
        });
      },
    );
  }

  @override
  Widget? buildBottomNavigationBar() {
    // return BottomNavigationBar(
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.image),
    //       label: '漫画',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.book),
    //       label: '小说',
    //     ),
    //   ],
    //   currentIndex: _pageIdx,
    //   onTap: (value) {
    //     _controller.jumpToPage(value);
    //   },
    // );

    final theme = context.watch<CurTheme>().curTheme;
    return BottomNavyBar(
      selectedIndex: _pageIdx,
      onItemSelected: (index) {
        setState(() => _pageIdx = index);
        _controller.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          title: const Text('漫画'),
          icon: const Icon(Icons.image),
          activeColor: theme.primaryColor,
          inactiveColor: theme.grayColor,
        ),
        BottomNavyBarItem(
          title: const Text('小说'),
          icon: const Icon(Icons.book),
          activeColor: theme.primaryColor,
          inactiveColor: theme.grayColor,
        ),
        BottomNavyBarItem(
          title: const Text('设置'),
          icon: const Icon(Icons.settings),
          activeColor: theme.primaryColor,
          inactiveColor: theme.grayColor,
        ),
      ],
    );
  }

  @override
  Future<bool> onWillPop() {
    if (Platform.isAndroid) {
      final DateTime now = DateTime.now();
      if (_lastPressedAt == null ||
          now.difference(_lastPressedAt!) > const Duration(seconds: 1)) {
        // 两次点击间超过1秒，重新计时
        _lastPressedAt = now;
        showToast('再次点击退出APP');
        return Future.value(false);
      }
    }
    return Future.value(true);
  }
}

import 'package:flutter/material.dart';

import '../novel/novel_page.dart';
import '../page_state.dart';
import '../comics/comics_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends BasePageState<IndexPage>
    with SingleTickerProviderStateMixin {
  int _pageIdx = 0;

  final List<Widget> _pages = const [
    ComicsPage(),
    NovelPage(),
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
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: '漫画',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: '小说',
        ),
      ],
      currentIndex: _pageIdx,
      onTap: (value) {
        _controller.jumpToPage(value);
      },
    );
  }
}

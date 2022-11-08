import 'package:comics_reader/pages/index/favorites/favorites_page.dart';
import 'package:flutter/material.dart';

import '../page_state.dart';
import 'library/library_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends BasePageState<IndexPage>
    with SingleTickerProviderStateMixin {
  int _pageIdx = 0;

  final List<Widget> _pages = const [
    LibraryPage(),
    FavoritesPage(),
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
          icon: Icon(Icons.library_books),
          label: '书库',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '收藏',
        ),
      ],
      currentIndex: _pageIdx,
      onTap: (value) {
        _controller.jumpToPage(value);
      },
    );
  }
}

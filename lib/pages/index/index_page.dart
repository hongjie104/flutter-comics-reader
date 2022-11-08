import 'package:comics_reader/global.dart';
import 'package:comics_reader/routes.dart';
import 'package:flutter/material.dart';

import '../page_state.dart';
import 'home/comics_list_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends BasePageState<IndexPage>
    with SingleTickerProviderStateMixin {
  @override
  String get title => "IndexPage";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: comicsCategory.length, vsync: this);
  }

  @override
  PreferredSizeWidget? buildHeader(
      {List<Widget>? actions,
      PreferredSizeWidget? bottom,
      IconThemeData? iconTheme,
      Widget? leading}) {
    return super.buildHeader(
        actions: [
          IconButton(onPressed: _onSearch, icon: const Icon(Icons.search)),
        ],
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          labelStyle: const TextStyle(fontSize: 20.0),
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4.0,
          tabs: [
            for (var i in comicsCategory) Text(i.display),
          ],
        ));
  }

  @override
  Widget? buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        Global.router.navigateTo(context, Routes.favorites);
      },
      child: const Icon(Icons.favorite),
    );
  }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        for (var i in comicsCategory) ComicsListPage(category: i),
      ],
    );
  }

  void _onSearch() {
    Global.router.navigateTo(context, Routes.search);
  }
}

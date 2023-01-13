import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/custom_theme.dart';
import '../../routes.dart';
import '../page_state.dart';
import 'newest.dart';
import 'rank.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  NovelPageState createState() => NovelPageState();
}

class NovelPageState extends BasePageState<NovelPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  PreferredSizeWidget? buildHeader(
      {List<Widget>? actions,
      PreferredSizeWidget? bottom,
      IconThemeData? iconTheme,
      Widget? leading}) {
    final curTheme = context.watch<CurTheme>().curTheme;
    return AppBar(
      title: TabBar(
        controller: _tabController,
        labelStyle: const TextStyle(fontSize: 20.0),
        labelColor: curTheme.whiteColor,
        unselectedLabelColor: curTheme.grayColor,
        indicatorColor: curTheme.whiteColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4.0,
        tabs: const [Text('最新'), Text('榜单')],
      ),
      iconTheme: iconTheme ?? Theme.of(context).iconTheme,
      actions: [
        IconButton(onPressed: _onSearch, icon: const Icon(Icons.search)),
        IconButton(onPressed: _onFavorite, icon: const Icon(Icons.favorite)),
      ],
      bottom: bottom,
      elevation: .0,
    );
  }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: const [
        Newest(),
        NovelRank(),
      ],
    );
  }

  void _onSearch() {
    context.push(Routes.novelSearch);
  }

  void _onFavorite() {
    context.push(Routes.novelFavorties);
  }
}

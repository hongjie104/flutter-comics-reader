import 'package:flutter/material.dart';

import '../../../global.dart';
import '../../../routes.dart';
import '../../page_state.dart';
import 'comics_list.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  LibraryPageState createState() => LibraryPageState();
}

class LibraryPageState extends BasePageState<LibraryPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

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
        labelStyle: const TextStyle(fontSize: 20.0),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4.0,
        tabs: [
          for (var i in comicsCategory) Text(i.display),
        ],
      ),
    );
    // return _Header(tabController: _tabController);
  }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        for (var i in comicsCategory) ComicsList(category: i),
      ],
    );
  }

  void _onSearch() {
    Global.router.navigateTo(context, Routes.search);
  }
}

// class _Header extends StatelessWidget implements PreferredSizeWidget {
//   final TabController tabController;
//   const _Header({required this.tabController});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: TabBar(
//         controller: tabController,
//         labelStyle: const TextStyle(fontSize: 20.0),
//         indicatorSize: TabBarIndicatorSize.label,
//         indicatorWeight: 4.0,
//         tabs: [
//           for (var i in comicsCategory) Text(i.display),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size(ScreenUtil().screenWidth, 164);
// }

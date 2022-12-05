import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../global.dart';
import '../../models/custom_theme.dart';
import '../../routes.dart';
import '../page_state.dart';
import 'comics_list.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({super.key});

  @override
  ComicsPageState createState() => ComicsPageState();
}

class ComicsPageState extends BasePageState<ComicsPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  // int _sourceIdx = 0;

  final ComicsSource _curSource = sourceList[0];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _curSource.categoryList.length,
      vsync: this,
    );
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
        tabs: [
          for (var i in _curSource.categoryList) Text(i.display),
        ],
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

  // @override
  // Widget? buildDrawer() {
  //   final curTheme = context.watch<CurTheme>().curTheme;
  //   return Drawer(
  //     child: ListView(
  //       // Important: Remove any padding from the ListView.
  //       padding: EdgeInsets.zero,
  //       children: [
  //         // DrawerHeader(
  //         //   decoration: BoxDecoration(
  //         //     color: curTheme.primaryColor,
  //         //   ),
  //         //   child: Text('Drawer Header'),
  //         // ),
  //         UserAccountsDrawerHeader(
  //           //设置用户名
  //           accountName: const Text('选择数据源'),
  //           //设置用户邮箱
  //           accountEmail: null, // Text('www.baidu.com'),
  //           //设置当前用户的头像
  //           currentAccountPicture: const CircleAvatar(
  //             backgroundImage: NetworkImage(
  //                 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F18%2F20180318183832_8TsFW.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1670578208&t=10376d13b9070299807fd89e0d620d5e'),
  //           ),
  //           arrowColor: curTheme.primaryColor,
  //           //回调事件
  //           onDetailsPressed: () {},
  //         ),
  //         for (var i = 0; i < sourceList.length; i++)
  //           CheckboxListTile(
  //             // 必须要的属性
  //             value: _sourceIdx == i,
  //             onChanged: (isCheck) {
  //               if (isCheck == true) {
  //                 setState(() {
  //                   _sourceIdx = i;
  //                 });
  //               }
  //             },
  //             activeColor: curTheme.primaryColor,
  //             title: Text(sourceList[i].name),
  //             // 是否密集垂直
  //             dense: false,
  //             controlAffinity: ListTileControlAffinity.trailing,
  //           ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        for (var i in _curSource.categoryList) ComicsList(category: i),
      ],
    );
  }

  void _onSearch() {
    context.push(Routes.comicsSearch);
  }

  void _onFavorite() {
    context.push(Routes.comicsFavorites);
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

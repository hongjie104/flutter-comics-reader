import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @protected
  String get title => "";

  @protected
  Color get pageColor => Colors.white;

  @protected
  bool get addWillPopScope => false;

  @override
  bool get wantKeepAlive => false;

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    WidgetsBinding.instance
      ..addObserver(this)
      ..addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  @protected
  @mustCallSuper
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 在布局完成之后的下一帧，会执行这个方法
  @protected
  @mustCallSuper
  void afterFirstLayout(BuildContext context) {}

  @override
  @mustCallSuper
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    // StatusBarUtil.changeStatusColor(statusBarColor);
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildScaffold();
  }

  @protected
  Widget buildScaffold() {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: buildHeader(),
      body: SafeArea(
        top: false,
        bottom: false,
        child: addWillPopScope
            ? WillPopScope(
                onWillPop: onWillPop,
                child: buildBody(),
              )
            : buildBody(),
      ),
      floatingActionButton: buildFAB(),
      floatingActionButtonLocation: getFloatingActionButtonLocation(),
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: buildDrawer(),
    );
  }

  @protected
  PreferredSizeWidget? buildHeader({
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    IconThemeData? iconTheme,
    Widget? leading,
  }) =>
      AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        iconTheme: iconTheme ?? Theme.of(context).iconTheme,
        actions: actions,
        bottom: bottom,
        elevation: .0,
        leading: leading,
      );

  @protected
  Widget buildBody();

  @protected
  Widget? buildFAB() => null;

  @protected
  Widget? buildDrawer() => null;

  @protected
  Widget? buildBottomNavigationBar() => null;

  @protected
  FloatingActionButtonLocation getFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  @protected
  Future<bool> onWillPop() {
    return Future.value(true);
  }
}

abstract class FetchDataPageState<T extends StatefulWidget>
    extends BasePageState<T> {
  late Future fetchDataFuture;

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    fetchDataFuture = fetchData();
  }

  @protected
  Future fetchData([bool isFristTime = true]);

  @override
  Widget buildBody() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot asyncData) {
        // 在这里根据快照的状态，返回相应的widget
        switch (asyncData.connectionState) {
          case ConnectionState.done:
            // if (asyncData.hasError) {
            //   // Debug.log(
            //   //   '============$pageName error=========',
            //   //   context: context,
            //   // );
            //   // Debug.log(
            //   //   asyncData.error.toString(),
            //   //   logLevel: LogLevel.error,
            //   //   context: context,
            //   // );
            // }
            if (asyncData.hasData) {
              return buildFetchedBody(data: asyncData.data);
            }
            return buildErrorLoading();
          default:
            return buildLoading();
        }
      },
      future: fetchDataFuture,
    );
  }

  @protected
  Widget buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  @protected
  Widget buildErrorLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  @protected
  Widget buildFetchedBody({dynamic data});

  @protected
  void refresh() {
    setState(() {
      fetchDataFuture = fetchData(false);
    });
  }
}

abstract class RefreshPageState<T extends StatefulWidget>
    extends BasePageState<T> {
  @protected
  late EasyRefreshController controller;

  @protected
  int page = 1;

  /// 条目总数
  @protected
  int count = 0;

  @override
  @mustCallSuper
  void initState() {
    controller = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
    super.initState();
  }

  @override
  @mustCallSuper
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget buildBody() {
    // if (_count == 0) return buildEmpty();
    return EasyRefresh(
      controller: controller,
      header: buildRefreshHeader(),
      footer: buildRefreshFooter(),
      onRefresh: onRefresh,
      onLoad: onLoad,
      child: buildChild(),
    );
  }

  // @protected
  // Widget buildEmpty() => const SizedBox();

  @protected
  Header buildRefreshHeader() => const ClassicHeader();

  @protected
  Footer buildRefreshFooter() => const ClassicFooter();

  @protected
  Widget buildChild() => ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              alignment: Alignment.center,
              height: 80,
              child: Text('${index + 1}'),
            ),
          );
        },
        itemCount: count,
      );

  @protected
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) {
      return;
    }
    setState(() {
      count = 10;
    });
    controller.finishRefresh();
    controller.resetFooter();
  }

  @protected
  Future<void> onLoad() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) {
      return;
    }
    setState(() {
      count += 5;
    });
    controller.finishLoad(
        count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
  }
}

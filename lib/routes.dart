import 'package:comics_reader/pages/comics_detail/comics_detail_page.dart';
import 'package:comics_reader/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/index/index_page.dart';

class Routes {
  static String comicsDetail = "/comicsDetail";
  static String root = "/";

  static FluroRouter configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (kDebugMode) {
        print("ROUTE WAS NOT FOUND !!!");
      }
      return;
    });
    _define(router, comicsDetail, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return ComicsDetailPage(
          coverData: ModalRoute.of(context!)?.settings.arguments as CoverData);
    }));
    _define(router, root, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const IndexPage();
    }));
    return router;
  }

  static _define(FluroRouter router, String routePath, Handler? handler) {
    router.define(
      routePath,
      handler: handler,
      transitionType: TransitionType.inFromRight,
    );
  }
}

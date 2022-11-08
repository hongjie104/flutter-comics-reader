import 'package:comics_reader/pages/comics_detail/comics_detail_page.dart';
import 'package:comics_reader/pages/comics_detail/comics_reader.dart';
import 'package:comics_reader/pages/index/favorites/favorites_page.dart';
import 'package:comics_reader/pages/index/search_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/index/index_page.dart';

class Routes {
  static String root = "/";
  static String search = "/search";
  static String favorites = "/favorites";
  static String comicsDetail = "/comicsDetail";
  static String comicsReader = "/comicsReader";

  static FluroRouter configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (kDebugMode) {
        print("ROUTE WAS NOT FOUND !!!");
      }
      return;
    });
    _define(router, root, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const IndexPage();
    }));
    _define(router, search, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SearchPage();
    }));
    _define(router, favorites, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const FavoritesPage();
    }));
    _define(router, comicsDetail, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsDetailPage();
    }));
    _define(router, comicsReader, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsReader();
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

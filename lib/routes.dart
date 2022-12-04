import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'pages/comics/comics_detail_page.dart';
import 'pages/comics/comics_reader.dart';
import 'pages/comics/favorites_page.dart';
import 'pages/comics/search_page.dart';
import 'pages/index/index_page.dart';
import 'pages/novel/favorites_page.dart';
import 'pages/novel/novel_detail_page.dart';
import 'pages/novel/novel_reader.dart';
import 'pages/novel/search_page.dart';
import 'pages/unlock/unlock_page.dart';

class Routes {
  static String root = "/";

  static String comicsSearch = "/comicsSearch";
  static String comicsFavorites = "/comicsFavorites";
  static String comicsDetail = "/comicsDetail";
  static String comicsReader = "/comicsReader";

  static String novelDetail = "/novelDetail";
  static String novelReader = "/novelReader";
  static String novelFavorties = "/novelFavorties";
  static String novelSearch = "/novelSearch";

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
      return Global.unlockPWD == null || Global.unlocked
          ? const IndexPage()
          : const UnlockPage();
    }));
    _define(router, comicsSearch, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsSearchPage();
    }));
    _define(router, comicsFavorites, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsFavoritesPage();
    }));
    _define(router, comicsDetail, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsDetailPage();
    }));
    _define(router, comicsReader, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const ComicsReader();
    }));
    _define(router, novelDetail, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NovelDetailPage();
    }));
    _define(router, novelReader, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NovelReader();
    }));
    _define(router, novelFavorties, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NovelFavoritesPage();
    }));
    _define(router, novelSearch, Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NovelSearchPage();
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

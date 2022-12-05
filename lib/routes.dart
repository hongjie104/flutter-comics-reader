import 'package:comics_reader/pages/comics/comics_detail_page.dart';
import 'package:comics_reader/pages/comics/comics_reader.dart';
import 'package:comics_reader/pages/novel/favorites_page.dart';
import 'package:comics_reader/pages/novel/novel_detail_page.dart';
import 'package:comics_reader/pages/novel/novel_reader.dart';
import 'package:comics_reader/pages/novel/search_page.dart';
import 'package:go_router/go_router.dart';

import 'global.dart';
import 'pages/comics/favorites_page.dart';
import 'pages/comics/search_page.dart';
import 'pages/index/index_page.dart';
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

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) => Global.unlockPWD == null || Global.unlocked
            ? const IndexPage()
            : const UnlockPage(),
      ),
      GoRoute(
        path: comicsSearch,
        builder: (context, state) => const ComicsSearchPage(),
      ),
      GoRoute(
        path: comicsFavorites,
        builder: (context, state) => const ComicsFavoritesPage(),
      ),
      GoRoute(
        path: comicsDetail,
        builder: (context, state) => const ComicsDetailPage(),
      ),
      GoRoute(
        path: comicsReader,
        builder: (context, state) => const ComicsReader(),
      ),
      GoRoute(
        path: novelSearch,
        builder: (context, state) => const NovelSearchPage(),
      ),
      GoRoute(
        path: novelFavorties,
        builder: (context, state) => const NovelFavoritesPage(),
      ),
      GoRoute(
        path: novelDetail,
        builder: (context, state) => const NovelDetailPage(),
      ),
      GoRoute(
        path: novelReader,
        builder: (context, state) => const NovelReader(),
      ),
    ],
  );
}

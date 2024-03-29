import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

import 'http.dart';
import 'models/comics.dart';

class API {
  static final API _instance = API._();

  API._();

  factory API() {
    return _instance;
  }

  Future _get(String path, {Map<String, dynamic>? queryParameters}) async {
    final r = await Http.get(path, queryParameters: queryParameters);
    return r;
  }

  // Future _post(
  //   String path, {
  //   dynamic data,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   final r = await Http.post(
  //     path,
  //     data: data,
  //     queryParameters: queryParameters,
  //   );
  //   return r;
  // }

  Future getRandomImage() {
    const fl = kDebugMode ? 'fengjing' : 'meizi';
    return _get('https://imgapi.cn/api.php?zd=mobile&fl=$fl&gs=json');
  }

  Future<List<ComicsData>?> getList(int page, int cat) async {
    final html = await _get(
        'https://www.hentaicomic.ru/albums-index-page-$page-cate-$cat.html');

    if (html != null) {
      final Document document = parse(html);
      final gallaryItemList = document.querySelectorAll('.gallary_item');

      final List<ComicsData> result = [];
      Element box;
      Element info;
      String url;
      List<String> infoArr;
      for (var gallaryItem in gallaryItemList) {
        box = gallaryItem.children[0].children[0];
        info = gallaryItem.children[1].children[1];
        url = box.attributes['href']!.toString();
        infoArr = info.text.trim().split('\n');
        result.add(ComicsData(
          id: url
              .replaceFirst('.html', '')
              .replaceFirst('/photos-index-aid-', ''),
          url: url,
          title: box.attributes['title']
              .toString()
              .replaceAll(RegExp(r'</?em>'), ''),
          coverImageUrl:
              'https:${box.children[0].attributes['src'].toString()}',
          numImage: int.parse(infoArr[0].replaceFirst('張照片，', '')),
          updateAt: infoArr[1].replaceFirst('創建於', ''),
        ));
      }
      return result;
    }
    return null;
  }

  Future<bool> getKoreanMangaDetail(ComicsData data) async {
    String url = data.url;
    if (!url.startsWith('http')) {
      url = 'https://www.hentaicomic.ru$url';
    }
    final html = await _get(url);
    if (html != null) {
      final Document document = parse(html);
      data.des =
          document.querySelector('.uwconn')!.querySelector('p')!.text.trim();
      data.category = document
          .querySelector('.uwconn')!
          .children[0]
          .text
          .trim()
          .replaceFirst('分類：', '')
          .replaceAll(' ', '');
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<List<String>> getKoreanMangaImages(String url) async {
    List<String>? result = [];
    if (!url.startsWith('http')) {
      url = 'https://www.hentaicomic.ru$url';
    }
    final html = await _get(url);
    if (html != null) {
      final Document document = parse(html);
      final scriptList = document.querySelectorAll('script');
      String imgHtmlUrl = '';
      for (var script in scriptList) {
        if (script.attributes['src'] != null &&
            script.attributes['src']!.startsWith('/photos-webp-aid')) {
          imgHtmlUrl = script.attributes['src']!;
          break;
        }
      }
      if (imgHtmlUrl.isNotEmpty) {
        final imgHtml = await _get('https://www.hentaicomic.ru$imgHtmlUrl');
        if (imgHtml != null) {
          final RegExp imgReg = RegExp(r'(/[a-z0-9\._\-]*)+jpg\\');
          for (var element in imgReg.allMatches(imgHtml).toList()) {
            // themes/weitu/images  包含这个的地址,就无视掉
            final imgUrl =
                'https:/${element.group(0)!.replaceFirst('\\', '').replaceFirst('/', '')}';
            if (!imgUrl.contains('themes/weitu/images')) result.add(imgUrl);
          }
        }
      }
    }
    return result;
  }

  Future<SearchComicsResult> searchComics(String key, int page) async {
    final result = SearchComicsResult();
    final html = await _get('https://www.hentaicomic.ru/search/index.php',
        queryParameters: {
          'q': key,
          'f': '韓漫 / 漢化', // 單行本 / 漢化
          's': 'create_time_DESC',
          'syn': 'yes',
          'p': page,
        });
    if (html != null) {
      final Document document = parse(html);
      final liList = document.querySelectorAll('.cc>li');
      late List<String> infoList;
      for (var li in liList) {
        infoList = li.children[1].children[1].text.trim().split('\n');
        result.list.add(ComicsData(
          id: li.children[0].children[0].attributes['href']
              .toString()
              .replaceFirst('/photos-index-aid-', '')
              .replaceFirst('.html', ''),
          url: li.children[0].children[0].attributes['href'].toString(),
          title: li.children[0].children[0].attributes['title']
              .toString()
              .replaceAll(RegExp(r'</?em>'), ''),
          coverImageUrl:
              'https:${li.children[0].children[0].children[0].attributes['src']}',
          numImage: int.parse(infoList[0].replaceFirst('張圖片，', '')),
          updateAt: infoList[1].replaceFirst('創建於', ''),
        ));
      }

      // 大約有2,965項符合查詢結果，庫內數據總量為148,714項。（搜索耗時：0.0046秒）
      String pageStr = document
          .querySelector('.span12>.result')!
          .text
          .trim()
          .split('項')[0]
          .replaceFirst('大約有', '')
          .replaceFirst(',', '');
      result.total = int.parse(pageStr);
    }
    return result;
  }

  /// 获取小说的全局解密码
  Future<String> getNovelHome() async {
    final html = await _get('https://txtnovel.today');
    final reg = RegExp(r'var tongji_uid = "[0-9a-z]{32}"');
    String? code = reg.stringMatch(html);
    if (code != null) {
      return code.replaceFirst('var tongji_uid = ', '').replaceAll('"', '');
    }
    return "";
  }

  /// 获取最新的小说
  Future getNewestNovel() {
    return _get(
      'https://txtnovel.today/api/hot/type/lastupdate/sort/0/length/50/',
    );
  }

  /// 获取小说的榜单
  /// type有四种值:today,week,month,all
  Future getRankNovel(String type, int length) {
    return _get(
      'https://txtnovel.today/api/hot/type/$type/sort/0/length/$length/',
    );
  }

  Future getNovelDetail({required String id}) {
    return _get('https://txtnovel.today/novel/$id.html');
  }

  Future getNovelInfo({required String id, required String token}) {
    return _get('https://txtnovel.today/tool/novel_info/aid/$id/token/$token/');
  }

  Future getNovelPageContent({required String id, required int pageIndex}) {
    return _get('https://txtnovel.today/novel/$id/$pageIndex.html');
  }

  Future searchNovel(String key, int page) async {
    return _get('https://txtnovel.today/search.html?key=$key&page=$page');
  }
}

class SearchComicsResult {
  final List<ComicsData> list = [];
  int total = 0;
  SearchComicsResult();
}

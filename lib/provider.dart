import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

import 'http.dart';

class Provider {
  static final Provider _instance = Provider._();

  Provider._();

  factory Provider() {
    return _instance;
  }

  Future _get(String path, {Map<String, dynamic>? queryParameters}) async {
    final r = await Http.get(path, queryParameters: queryParameters);
    return r;
  }

  Future _post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final r = await Http.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return r;
  }

  Future<List<CoverData>?> getKoreanManga(int page, int pageSize) async {
    final html = await _get(
        'https://www.hentaicomic.ru/albums-index-page-$page-cate-$pageSize.html');

    if (html != null) {
      final Document document = parse(html);
      final gallaryItemList = document.querySelectorAll('.gallary_item');

      final List<CoverData> result = [];
      Element box;
      Element info;
      String url;
      List<String> infoArr;
      for (var gallaryItem in gallaryItemList) {
        box = gallaryItem.children[0].children[0];
        info = gallaryItem.children[1].children[1];
        url = box.attributes['href']!.toString();
        infoArr = info.text.trim().split('\n');
        result.add(CoverData(
          id: url
              .replaceFirst('.html', '')
              .replaceFirst('/photos-index-aid-', ''),
          url: url,
          title: box.attributes['title'].toString(),
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

  Future getKoreanMangaDetail(String url) async {
    if (!url.startsWith('http')) {
      url = 'https://www.hentaicomic.ru$url';
    }
    final html = await _get(url);
    if (html != null) {
      final Document document = parse(html);
      final des =
          document.querySelector('.uwconn')!.querySelector('p')!.text.trim();
      print(des);
    }
  }

  Future getKoreanMangaImages(String url) async {
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
          final RegExp imgReg = RegExp(r'(/[a-z0-9\._]*)+jpg\\');
          for (var element in imgReg.allMatches(imgHtml).toList()) {
            // themes/weitu/images  包含这个的地址,就无视掉
            print(
                'https:/${element.group(0)!.replaceFirst('\\', '').replaceFirst('/', '')}');
          }
        }
      }
    }
  }
}

class CoverData {
  final String id;
  final String url;
  final String title;
  final String coverImageUrl;
  final int numImage;
  final String updateAt;

  CoverData({
    required this.id,
    required this.url,
    required this.title,
    required this.coverImageUrl,
    required this.numImage,
    required this.updateAt,
  });
}

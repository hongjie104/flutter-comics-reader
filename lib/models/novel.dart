import '../utils/decrypt.dart';

class NovelData {
  final int allVisit;
  final String id;
  final String name;
  final String author;
  final int dayVisit;
  final DateTime updateAt;
  final int monthVisit;
  final int weekVisit;
  // sort: "BL"
  // sortid: "1"

  NovelData({
    required this.id,
    required this.name,
    required this.author,
    required this.updateAt,
    required this.dayVisit,
    required this.weekVisit,
    required this.monthVisit,
    required this.allVisit,
  });

  factory NovelData.fromJson(dynamic data, String decryptCode) {
    return NovelData(
      id: data['articleid'],
      updateAt: DateTime.parse(data['lastupdate']),
      name: decryptAESCryptoJS(data['articlename'], decryptCode),
      author: decryptAESCryptoJS(data['author'], decryptCode),
      dayVisit: int.parse(data['dayvisit']),
      weekVisit: int.parse(data['weekvisit']),
      monthVisit: int.parse(data['monthvisit']),
      allVisit: int.parse(data['allvisit']),
    );
  }
}

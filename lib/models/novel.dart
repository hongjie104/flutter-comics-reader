import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';
import '../utils/decrypt.dart';

class NovelData {
  final String id;
  final String name;
  final String author;
  int dayVisit;
  DateTime? updateAt;
  int monthVisit;
  int weekVisit;
  int allVisit;
  // sort: "BL"
  // sortid: "1"
  int readedPage = 0;
  int size = 0;
  int firstPageIndex = 0;
  int lastPageIndex = 0;
  String des = '';

  NovelData({
    required this.id,
    required this.name,
    required this.author,
    this.dayVisit = 0,
    this.weekVisit = 0,
    this.monthVisit = 0,
    this.allVisit = 0,
    this.des = '',
    this.updateAt,
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

  factory NovelData.fromString(String str) {
    final arr = str.split('&');
    return NovelData(
      id: arr[0],
      updateAt: DateTime.tryParse(arr[3]),
      name: arr[1],
      author: arr[2],
      dayVisit: int.parse(arr[4]),
      weekVisit: int.parse(arr[5]),
      monthVisit: int.parse(arr[6]),
      allVisit: int.parse(arr[7]),
    );
  }

  @override
  String toString() {
    return '$id&$name&$author&${updateAt!.year}-${updateAt!.month}-${updateAt!.day}&$dayVisit&$weekVisit&$monthVisit&$allVisit';
  }
}

class NovelFavorites with ChangeNotifier {
  final List<NovelData> dataList = [];

  void init() {
    SharedPreferences.getInstance().then((value) {
      final strList =
          value.getStringList(LocalStorageCategory.novelFavorites.name);
      if (strList != null) {
        for (var str in strList) {
          dataList.add(NovelData.fromString(str));
        }
      }
    });
  }

  bool isFavorted(String id) {
    for (var element in dataList) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }

  void add(NovelData data) {
    for (var element in dataList) {
      if (element.id == data.id) {
        return;
      }
    }
    dataList.add(data);
    notifyListeners();
    _save();
  }

  void remove(String id) {
    for (var element in dataList) {
      if (element.id == id) {
        dataList.remove(element);
        notifyListeners();
        _save();
        return;
      }
    }
  }

  void setReadedPage(String id, int page) {
    for (var element in dataList) {
      if (element.id == id) {
        element.readedPage = page;
        notifyListeners();
        _save();
        return;
      }
    }
  }

  void _save() {
    final List<String> strList = [];
    for (var data in dataList) {
      strList.add(data.toString());
    }
    SharedPreferences.getInstance().then((value) {
      value.setStringList(LocalStorageCategory.novelFavorites.name, strList);
    });
  }
}

class CurNovel with ChangeNotifier {
  NovelData? _data;
  NovelData? get data => _data;
  set data(NovelData? val) {
    _data = val;
    notifyListeners();
  }

  void setReadedPage(int page) {
    if (_data != null) {
      _data!.readedPage = page;
      notifyListeners();
    }
  }

  void updateInfo(
    int dayVisit,
    int weekVisit,
    int allVisit,
    int updateAt,
    int size,
    int firstPageIndex,
    int lastPageIndex,
  ) {
    if (_data != null) {
      _data!.dayVisit = dayVisit;
      _data!.weekVisit = weekVisit;
      _data!.allVisit = allVisit;
      _data!.size = size;
      _data!.updateAt = DateTime.fromMillisecondsSinceEpoch(updateAt * 1000);
      _data!.firstPageIndex = firstPageIndex;
      _data!.lastPageIndex = lastPageIndex;
      notifyListeners();
    }
  }
}

import 'package:comics_reader/global.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComicsData {
  final String id;
  final String url;
  final String title;
  final String coverImageUrl;
  final int numImage;
  final String updateAt;
  String? des;
  String? category;
  List<String>? imgUrlList;
  int readedPage = 0;

  ComicsData({
    required this.id,
    required this.url,
    required this.title,
    required this.coverImageUrl,
    required this.numImage,
    required this.updateAt,
    this.readedPage = 0,
  });

  factory ComicsData.fromString(String str) {
    final arr = str.split('&');
    return ComicsData(
      id: arr[0],
      url: arr[1],
      title: arr[2],
      coverImageUrl: arr[3],
      numImage: int.parse(arr[4]),
      updateAt: arr[5],
      readedPage: arr.length > 6 ? int.parse(arr[6]) : 0,
    );
  }

  @override
  String toString() {
    return '$id&$url&$title&$coverImageUrl&$numImage&$updateAt&$readedPage';
  }
}

class ComicsFavorites with ChangeNotifier {
  final List<ComicsData> dataList = [];

  void init() {
    SharedPreferences.getInstance().then((value) {
      final strList = value.getStringList(LocalStorageCategory.favorites.name);
      if (strList != null) {
        for (var str in strList) {
          dataList.add(ComicsData.fromString(str));
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

  void add(ComicsData data) {
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
      value.setStringList(LocalStorageCategory.favorites.name, strList);
    });
  }
}

class CurComics with ChangeNotifier {
  ComicsData? _data;
  ComicsData? get data => _data;
  set data(ComicsData? val) {
    _data = val;
    notifyListeners();
  }

  void setReadedPage(int page) {
    if (_data != null) {
      _data!.readedPage = page;
      notifyListeners();
    }
  }
}

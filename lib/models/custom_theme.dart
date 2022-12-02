import 'package:flutter/material.dart';

class CostomTheme {
  final MaterialColor primaryColor = const MaterialColor(
    0xfffa817e,
    <int, Color>{
      50: Color(0xfffa817e),
      100: Color(0xfffa817e),
      200: Color(0xfffa817e),
      300: Color(0xfffa817e),
      400: Color(0xfffa817e),
      500: Color(0xfffa817e),
      600: Color(0xfffa817e),
      700: Color(0xfffa817e),
      800: Color(0xfffa817e),
      900: Color(0xfffa817e),
    },
  );
  final Color secondColor = const Color(0xff7982fa);
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color blackColor = const Color(0xFF333333);
  final Color grayColor = const Color(0xFFCCCCCC);
}

class CurTheme with ChangeNotifier {
  CostomTheme _curTheme = CostomTheme();
  CostomTheme get curTheme => _curTheme;
  set curTheme(CostomTheme val) {
    _curTheme = val;
    notifyListeners();
  }
}

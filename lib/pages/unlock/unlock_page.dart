import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../api.dart';
import '../../global.dart';
import '../../models/custom_theme.dart';
import '../../routes.dart';
import '../page_state.dart';

class UnlockPage extends StatefulWidget {
  const UnlockPage({super.key});

  @override
  UnlockPageState createState() => UnlockPageState();
}

class UnlockPageState extends FetchDataPageState<UnlockPage> {
  @override
  String get title => "UnlockPage";

  @override
  bool get addWillPopScope => true;

  String _imgUrl = '';

  // 上次点击时间
  DateTime? _lastPressedAt;

  @override
  Future fetchData([bool isFristTime = true]) async {
    final data = await API().getRandomImage();
    if (data != null) {
      setState(() {
        _imgUrl = data['imgurl'];
      });
    }
    return Future.value(data);
  }

  @override
  PreferredSizeWidget? buildHeader(
          {List<Widget>? actions,
          PreferredSizeWidget? bottom,
          IconThemeData? iconTheme,
          Widget? leading}) =>
      null;

  @override
  Widget buildFetchedBody({data}) {
    final theme = context.read<CurTheme>().curTheme;
    return Stack(
      children: [
        Center(child: Image.network(_imgUrl, fit: BoxFit.cover)),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 36.0,
                onPressed: _showLock,
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: theme.primaryColor,
                ),
              ),
              TextButton(
                onPressed: _showLock,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '点击进入',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3.0
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      '点击进入',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Future<bool> onWillPop() {
    if (Platform.isAndroid) {
      final DateTime now = DateTime.now();
      if (_lastPressedAt == null ||
          now.difference(_lastPressedAt!) > const Duration(seconds: 1)) {
        // 两次点击间超过1秒，重新计时
        _lastPressedAt = now;
        showToast('再次点击退出APP');
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  void _showLock() {
    screenLock(
      context: context,
      correctString: Global.unlockPWD!,
      onUnlocked: () {
        Global.unlocked = true;
        context.replace(Routes.root);
      },
    );
  }
}

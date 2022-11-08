import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'global.dart';
import 'models/comics.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _runApp();
}

void _runApp() async {
  // 初始化路由
  Global.router = Routes.configureRoutes(FluroRouter());
  final favorites = Favorites()..init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => favorites),
      ChangeNotifierProvider(create: (_) => CurComics()),
    ],
    child: const MyApp(),
  ));
  // runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      builder: (context, child) => OKToast(
        textStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
        backgroundColor: Colors.black87,
        radius: 10.0,
        animationCurve: Curves.easeIn,
        // animationBuilder: const Miui10AnimBuilder(),
        animationDuration: const Duration(milliseconds: 200),
        duration: const Duration(seconds: 3),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CheckPal',
          // theme: ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // Try running your application with "flutter run". You'll see the
          //   // application has a blue toolbar. Then, without quitting the app, try
          //   // changing the primarySwatch below to Colors.green and then invoke
          //   // "hot reload" (press "r" in the console where you ran "flutter run",
          //   // or simply save your changes to "hot reload" in a Flutter IDE).
          //   // Notice that the counter didn't reset back to zero; the application
          //   // is not restarted.
          //   primarySwatch: Colors.blue,
          //   // iconTheme: const IconThemeData.fallback().copyWith(
          //   //   color: const Color.fromARGB(255, 79, 117, 164),
          //   // ),
          //   // fontFamily: "KumbhSans",
          //   platform: TargetPlatform.iOS,
          // ),
          theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue).copyWith(
            platform: TargetPlatform.iOS,
          ),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue).copyWith(
            platform: TargetPlatform.iOS,
          ),
          // Use dark or light theme based on system setting.
          themeMode: ThemeMode.system,
          onGenerateRoute: Global.router.generator,
          // initialRoute: launched == true ? null : Routes.introductionPage(),
          navigatorKey: navigatorKey,
          // navigatorObservers:
          //     DeviceInfo.instance.isPhysicalDevice && !onlyInnerNet
          //         ? [
          //             FirebaseAnalyticsObserver(
          //               analytics: FirebaseAnalytics.instance,
          //             ),
          //           ]
          //         : [],
        ),
      ),
    );
  }
}

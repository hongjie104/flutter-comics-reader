import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:retry/retry.dart';

import 'global.dart';

class Http {
  static final _dio = Dio(BaseOptions(
    // baseUrl: "http://httpbin.org",
    baseUrl: kDebugMode
        ? "http://192.168.31.11:7004/api"
        : "http://54.152.139.203:7004/api",
    // : "http://106.15.93.73:7004/api",
    // baseUrl: "http://54.152.139.203:7004/api",
    connectTimeout: 50000, // 50秒
    receiveTimeout: 50000,
  ));

  static Options _createOptions() {
    return Options(
      headers: {
        'user-agent':
            userAgentList[Random.secure().nextInt(userAgentList.length)],
        // 'cookie': {
        //   'PHPSESSID': '9777de72661e07475e0f6b4b905adaaa',
        //   'fontsize': '18',
        //   'Hm_lvt_005d4928b0ced4dd8cbe9dbeafa7f8c9': '1670029955',
        //   '__cf_bm':
        //       'vYhmoYr5lFlvwgY1I6XA0TfMiWjv1vvMPnD6MGkMmwc-1670033193-0-AY+jV+kvaLEAd2Se35FQyTIJhfDSt7d2sNSzPACfTTjBcfHtwL8wLBpWCsrEryFe+ISKB++dm7nI9cnNRPPeDE1dulYkIUETmE6nUX+i9KWg1p1gOQnatwxKcCWX2fLRoH9SJ2j3gys8cJ+94AlHr3I=',
        //   'Hm_lpvt_005d4928b0ced4dd8cbe9dbeafa7f8c9': '1670033248',
        // }
      },
    );
  }

  static Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (kDebugMode) {
      print("get => $path");
    }
    int retryTimes = 0;
    final res = await retry(
      // Make a GET request
      () => _dio
          .get(
            path,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            options: _createOptions(),
          )
          .timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      // retryIf: (e) => e is SocketException || e is TimeoutException,
      retryIf: (e) {
        if (retryTimes > 20) {
          showToast('网络有问题,请稍后再试~');
          return false;
        }
        retryTimes += 1;
        return true;
      },
      onRetry: (e) {
        showToast("网络有点问题,第${retryTimes + 1}次重试中,请稍候~");
      },
    );
    return Future.value(res.data);
    // try {
    //   if (kDebugMode) {
    //     print("get => $path");
    //   }
    //   Response res = await _dio.get(
    //     path,
    //     queryParameters: queryParameters,
    //     cancelToken: cancelToken,
    //     onReceiveProgress: onReceiveProgress,
    //     options: _createOptions(),
    //   );
    //   // if (kDebugMode) {
    //   //   print("get <= ${res.data}");
    //   // }
    //   // if (res.data['success']) {
    //   //   return Future.value(res.data);
    //   // } else {
    //   //   showToast(res.data['msg']);
    //   // }
    //   return Future.value(res.data);
    // } on DioError catch (e) {
    //   // The request was made and the server responded with a status code
    //   // that falls out of the range of 2xx and is also not 304.
    //   if (kDebugMode) {
    //     print('data = ${e.response?.data}');
    //     print('response.headers = ${e.response?.headers}');
    //     print('response.requestOptions = ${e.response?.requestOptions}');
    //     print('requestOptions = ${e.requestOptions}');
    //     print('message = ${e.message}');
    //     print('error = ${e.toString()}');
    //   }
    //   showToast('网络错误,请稍后再试');
    // }
    // return Future.value(null);
  }

  static Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (kDebugMode) {
        print("post => $path");
        print(data);
      }
      Response res = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: _createOptions(),
      );
      if (kDebugMode) {
        print("post <= ${res.data}");
      }
      // if (res.data['success']) {
      //   return Future.value(res.data);
      // } else {
      //   showToast(res.data['msg']);
      // }
      return Future.value(res.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (kDebugMode) {
        print('data = ${e.response?.data}');
        print('headers = ${e.response?.headers}');
        print('requestOptions = ${e.response?.requestOptions}');
        print('requestOptions = ${e.requestOptions}');
        print('message = ${e.message}');
      }
      showToast(e.message);
    }
    return Future.value(null);
  }

  // static Future download() async {
  //   await _dio.download(urlPath, savePath)
  // }
}

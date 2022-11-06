import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';

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
        'user-agent': USER_AGENT[Random.secure().nextInt(USER_AGENT.length)],
      },
    );
  }

  static Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (kDebugMode) {
        print("get => $path");
      }
      Response res = await _dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: _createOptions(),
      );
      // if (kDebugMode) {
      //   print("get <= ${res.data}");
      // }
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
        print('response.headers = ${e.response?.headers}');
        print('response.requestOptions = ${e.response?.requestOptions}');
        print('requestOptions = ${e.requestOptions}');
        print('message = ${e.message}');
        print('error = ${e.toString()}');
      }
      showToast('网络错误,请稍后再试');
    }
    return Future.value(null);
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
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';

class DioFactory {
  Dio getDio() {
    final Dio dio = Dio();

    const int timeOut = 15 * 1000;

    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: AppConstants.applicationJson,
      HttpHeaders.acceptHeader: AppConstants.applicationJson,
      HttpHeaders.authorizationHeader: AppUrls.apiKey,
      HttpHeaders.acceptLanguageHeader: AppConstants.language,
    };

    dio.options = BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: headers,
      receiveTimeout: timeOut,
      sendTimeout: timeOut,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        responseHeader: false,
        requestHeader: false,
        request: true,
        requestBody: true,
        error: true,
      ));
    }
    return dio;
  }
}

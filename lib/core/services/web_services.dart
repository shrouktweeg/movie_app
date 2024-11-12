import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/config/constants.dart';


class WebServices {
  static WebServices? _this;
  Dio dio = Dio();

  factory WebServices() {
    if (_this == null) {
      return WebServices._();
    } else {
      return _this!;
    }
  }

  WebServices._() {
    dio.options.baseUrl = Constants.domain;
    dio.options.headers = {"Authorization": "Bearer ${Constants.token}"};
    initializeInterceptors();
  }

  initializeInterceptors() {
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          // options.headers["Authorization"] ="Bear ${Constants.accessToken}";
          debugPrint("--->Interceptor on request start<----");
          print("base url -->>> ${options.baseUrl}");
          print("headers -->>> ${options.headers}");
          print("query params -->>> ${options.queryParameters}");
          print("path --> ${options.path}");

          debugPrint("--->Interceptor on request end<----");
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          debugPrint("--->Interceptor on response start<----");
          debugPrint("Status code: ${response.statusCode}");
          debugPrint("Data count: ${response.data}");
          debugPrint("--->Interceptor on response end<----");
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          debugPrint("--->Interceptor on error start<----");
          debugPrint("Status code: ${error.response?.statusCode}");
          debugPrint("Error: ${error.message}");
          debugPrint("--->Interceptor on error end<----");
          return handler.next(error);
        },
      ),
    );
  }
}

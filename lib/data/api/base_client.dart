import 'package:dio/dio.dart';

import 'endpoints.dart';

class BaseClient {
  BaseClient._();

  static final BaseClient _instanse = BaseClient._();

  factory BaseClient() {
    return _instanse;
  }

  final dio = Dio(BaseOptions(
    connectTimeout: EndPoints.connectTimeout,
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true,
    receiveTimeout: EndPoints.receiveTimeout,
  ))
    ..interceptors.addAll(
      [
        // ErrorInterceptor(),
        // LogInterceptor(
        //   responseBody: true,
        //   error: true,
        //   request: true,
        //   requestBody: true,
        //   requestHeader: false,
        //   responseHeader: false,
        // )
      ],
    );
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await dio.get(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }
}

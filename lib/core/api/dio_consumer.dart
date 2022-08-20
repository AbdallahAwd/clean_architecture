import 'dart:io';
import 'package:clean_arch/core/api/api_consumer.dart';
import 'package:clean_arch/core/api/endpoint.dart';
import 'package:clean_arch/core/api/status_code.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:clean_arch/injector.dart' as di;
import 'app_interceptor.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoint.BASE_URL
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.sl<LogInterceptor>());
    client.interceptors.add(di.sl<AppInterceptor>());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}

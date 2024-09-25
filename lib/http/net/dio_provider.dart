import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/http/net/dio_interceptor.dart';
import 'package:zhihu/http/net/logger_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {
        "user-agent": "",
        "content-type": "application/json",
      }))
    ..interceptors.add(DioInterceptor())
    ..interceptors.add(LoggerInterceptor());

  return dio;
}

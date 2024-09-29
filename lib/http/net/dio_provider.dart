import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/http/net/dio_interceptor.dart';
import 'package:zhihu/http/net/logger_interceptor.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio(BaseOptions(
      baseUrl: "https://news-at.zhihu.com/api/4/",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {
        'Host': 'news-at.zhihu.com',
        'User-Agent':
            'YangSuGuo/flutter_news 1.0.0 (https://github.com/YangSuGuo/flutter_news)',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }))
    ..interceptors.add(DioInterceptor())
    ..interceptors.add(LoggerInterceptor());

  return dio;
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/http/api/api.dart';
import 'package:zhihu/http/net/dio_provider.dart';
import 'package:zhihu/model/stories_model.dart';

part 'stories_model.g.dart';

class StoriesModel {
  final Dio dio;

  StoriesModel({
    required this.dio,
  });

  // 今日
  Future<List<StoriesData>> getList() async {
    final response = await dio.get(Api.zhihuList);
    if (response.statusCode == 200) {
      final data = response.data;
      final List<dynamic> dataList = data['stories'];
      final List<StoriesData> items =
          dataList.map((json) => StoriesData.fromJson(json)).toList();
      final formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
      log('数据为: $formattedDate');
      return items;
    } else {
      throw Exception('加载数据失败');
    }
  }

  // 往期
  Future<List<StoriesData>> getOldList(DateTime date) async {
    final formattedDate = DateFormat('yyyyMMdd').format(date);
    final response = await dio.get('${Api.zhihuOldList}$formattedDate');
    if (response.statusCode == 200) {
      final data = response.data;
      final List<dynamic> dataList = data['stories'];
      final List<StoriesData> items =
          dataList.map((json) => StoriesData.fromJson(json)).toList();
      log('数据为: $formattedDate');
      return items;
    } else {
      throw Exception('加载数据失败');
    }
  }
}

@riverpod
StoriesModel storiesModel(StoriesModelRef ref) => StoriesModel(
      dio: ref.watch(dioProvider),
    );

@riverpod
Future<List<StoriesData>> getList(GetListRef ref) async {
  final storiesModel = ref.read(storiesModelProvider);
  return storiesModel.getList();
}

@riverpod
Future<List<StoriesData>> getOldList(GetOldListRef ref, DateTime date) async {
  final storiesModel = ref.read(storiesModelProvider);
  return storiesModel.getOldList(date);
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/http/api/api.dart';
import 'package:zhihu/http/net/dio_provider.dart';
import 'package:zhihu/model/comments_model.dart';
import 'package:zhihu/model/commentsinfo_model.dart';
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
      final List<StoriesData> items = dataList.map((json) => StoriesData.fromJson(json)).toList();
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
      final List<StoriesData> items = dataList.map((json) => StoriesData.fromJson(json)).toList();
      log('数据为: $formattedDate');
      return items;
    } else {
      throw Exception('加载数据失败');
    }
  }

  // 评论信息
  Future<CommentInfoData> getCommentsInfo(int id) async {
    final response = await dio.get('${Api.zhihuCommentsInfo}$id');
    if (response.statusCode == 200) {
      final data = response.data;
      final CommentInfoData commentInfoData = CommentInfoData.fromJson(data);
      return commentInfoData;
    } else {
      throw Exception('获取评论数据失败');
    }
  }

  // 长评论
  Future<List<CommentsData>> getComments(String id) async {
    final response = await dio.get('${Api.zhihuBody}$id${Api.zhihuComments}');
    if (response.statusCode == 200) {
      final data = response.data;
      final List commentsJson = data['comments'];
      List<CommentsData> comments = commentsJson.map((json) => CommentsData.fromJson(json)).toList();
      return comments;
    } else {
      throw Exception('获取长评论数据失败');
    }
  }

  // 短评论
  Future<List<CommentsData>> getShortComments(String id) async {
    final response = await dio.get('${Api.zhihuBody}$id${Api.zhihuShortComments}');
    if (response.statusCode == 200) {
      final data = response.data;
      final List commentsJson = data['comments'];
      List<CommentsData> comments = commentsJson.map((json) => CommentsData.fromJson(json)).toList();
      return comments;
    } else {
      throw Exception('获取长评论数据失败');
    }
  }
}

@riverpod
StoriesModel storiesModel(Ref ref) => StoriesModel(
      dio: ref.watch(dioProvider),
    );

@riverpod
Future<List<StoriesData>> getList(Ref ref) async {
  final storiesModel = ref.read(storiesModelProvider);
  return storiesModel.getList();
}

@riverpod
Future<List<StoriesData>> getOldList(Ref ref, DateTime date) async {
  final storiesModel = ref.read(storiesModelProvider);
  return storiesModel.getOldList(date);
}

@riverpod
Future<CommentInfoData> getCommentsInfo(Ref ref, int id) async {
  final storiesModel = ref.read(storiesModelProvider);
  return storiesModel.getCommentsInfo(id);
}

@riverpod
Future<List<CommentsData>> getComments(Ref ref, String id, bool isShort) async {
  final storiesModel = ref.read(storiesModelProvider);
  if (isShort) {
    return storiesModel.getShortComments(id);
  } else {
    return storiesModel.getComments(id);
  }
}

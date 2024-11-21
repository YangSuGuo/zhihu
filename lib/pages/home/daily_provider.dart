import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../http/api/stories_model.dart';
import '../../model/stories_model.dart';

part 'daily_provider.g.dart';

@riverpod
class DailyReportState extends _$DailyReportState {
  late DateTime dateTime;
  List<StoriesData> items = [];

  @override
  FutureOr<List<StoriesData>> build() async {
    dateTime = DateTime.now().subtract(const Duration(days: 1));
    items = await _initialData();
    return items;
  }

  // 初始化数据
  Future<List<StoriesData>> _initialData() async {
    final newItems = await ref.read(getListProvider.future);
    final oldItems = await ref.read(getOldListProvider(dateTime).future);
    List<StoriesData> items = [...newItems, ...oldItems];
    return items;
  }

  // 下拉刷新
  Future<void> refresh() async {
    final newItems = await ref.read(getListProvider.future);
    final oldIds =
        items.map((item) => item.id).toList().sublist(0, newItems.length);
    final newIds = newItems.map((item) => item.id).toList();
    if (!listEquals(oldIds, newIds)) {
      items.replaceRange(0, newIds.length, newItems);
      state = AsyncValue.data(items);
    }
  }

  // 上拉加载
  Future<void> loadMore() async {
    dateTime = dateTime.subtract(const Duration(days: 1));
    final moreItems = await ref.read(getOldListProvider(dateTime).future);
    items.addAll(moreItems);
    state = AsyncValue.data(items);
    log("列表长度：${items.length}");
  }
}

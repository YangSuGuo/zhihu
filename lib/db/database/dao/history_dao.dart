import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/db.dart';
import 'package:zhihu/db/database/entity/history.dart';
import 'package:zhihu/db/database/entity/stars.dart';

part 'history_dao.g.dart';

@dao
abstract class HistoryDAO {
  // 查询全部
  @Query('SELECT * FROM history ORDER BY readingTime DESC')
  Future<List<Stars>> findAllSubjectsHistory();

  // 清空历史记录
  @Query('DELETE FROM history')
  Future<void> deleteAllSubjectsHistory();

  // 添加历史记录
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSubjectsHistory(History history);
}

@riverpod
Future<List<Stars>> findAllSubjectsHistory(Ref ref) async {
  final db = ref.read(dbProvider);
  return await db.HistoryDao.findAllSubjectsHistory();
}

@riverpod
Future<void> deleteAllSubjectsHistory(Ref ref) async {
  final db = ref.read(dbProvider);
  await db.HistoryDao.deleteAllSubjectsHistory();
}

@riverpod
Future<void> insertSubjectsHistory(Ref ref, History history) async {
  final db = ref.read(dbProvider);
  await db.HistoryDao.insertSubjectsHistory(history);
}

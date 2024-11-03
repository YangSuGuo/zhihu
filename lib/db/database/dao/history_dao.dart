import 'package:floor/floor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/db.dart';
import 'package:zhihu/db/database/entity/history.dart';

part 'history_dao.g.dart';

@dao
abstract class HistoryDAO {
  // 查询全部
  @Query('SELECT * FROM history ORDER BY readingTime DESC')
  Future<List<History>> findAllSubjectsHistory();

  // 清空历史记录
  @Query('DELETE FROM history')
  Future<void> deleteAllSubjectsHistory();

  // 添加历史记录
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSubjectsHistory(History history);
}

@riverpod
Future<void> insertSubjectsHistory(InsertSubjectsHistoryRef ref, History history) async {
  final db = ref.read(dbProvider);
  await db.HistoryDao.insertSubjectsHistory(history);
}

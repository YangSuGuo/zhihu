import 'package:floor/floor.dart';
import 'package:zhihu/db/database/entity/history.dart';

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

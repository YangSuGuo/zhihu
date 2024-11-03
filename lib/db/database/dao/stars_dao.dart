import 'package:floor/floor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/db.dart';
import 'package:zhihu/db/database/entity/stars.dart';

part 'stars_dao.g.dart';

@dao
abstract class StarsDAO {
  // 查询全部
  @Query('SELECT * FROM stars ORDER BY readingTime DESC')
  Future<List<Stars>> findAllSubjectsStars();

  // 删除
  @Query('DELETE FROM stars WHERE id = :id')
  Future<void> deleteStars(int id);

  // 添加
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertStars(Stars stars);

  // 查询收藏状态
  @Query('SELECT EXISTS(SELECT 1 FROM stars WHERE id = :id)')
  Future<bool?> selectStars(int id);
}

@riverpod
Future<void> deleteStars(DeleteStarsRef ref, int id) async {
  final db = ref.read(dbProvider);
  await db.StarsDao.deleteStars(id);
}

@riverpod
Future<void> insertStars(InsertStarsRef ref, Stars stars) async {
  final db = ref.read(dbProvider);
  await db.StarsDao.insertStars(stars);
}

@riverpod
Future<bool> isSaved(IsSavedRef ref, int id) async {
  final db = ref.read(dbProvider);
  bool isSaved = await db.StarsDao.selectStars(id) ?? false;
  return isSaved;
}

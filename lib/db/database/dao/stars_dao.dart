import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/entity/stars.dart';

import '../database.dart';

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
Future<List<Stars>> findAllSubjectsStars(Ref ref) async {
  final db = ref.read(dbProvider);
  return await db.StarsDao.findAllSubjectsStars();
}

@riverpod
Future<void> deleteStars(Ref ref, int id) async {
  final db = ref.read(dbProvider);
  await db.StarsDao.deleteStars(id);
}

@riverpod
Future<void> insertStars(Ref ref, Stars stars) async {
  final db = ref.read(dbProvider);
  await db.StarsDao.insertStars(stars);
}

@riverpod
Future<bool> isSaved(Ref ref, int id) async {
  final db = ref.read(dbProvider);
  bool isSaved = await db.StarsDao.selectStars(id) ?? false;
  return isSaved;
}

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:zhihu/db/database/dao/history_dao.dart';
import 'package:zhihu/db/database/dao/stars_dao.dart';
import 'package:zhihu/db/database/entity/history.dart';
import 'package:zhihu/db/database/entity/stars.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Stars, History])
abstract class AppDatabase extends FloorDatabase {
  // 用户收藏
  StarsDAO get StarsDao;

  // 浏览记录
  HistoryDAO get HistoryDao;

  // 清空所有表数据
  Future<void> clearAllTables() async {
    await database.execute('DELETE FROM stars');
    await database.execute('DELETE FROM history');
  }
}

@Riverpod(keepAlive: true)
AppDatabase db(Ref ref) {
  return throw UnimplementedError();
}

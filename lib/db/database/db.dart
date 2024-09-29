import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/database.dart';

part 'db.g.dart';

@Riverpod(keepAlive: true)
AppDatabase db(DbRef ref) {
  return throw UnimplementedError();
}

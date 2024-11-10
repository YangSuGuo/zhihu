import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zhihu/db/database/database.dart';

part 'db.g.dart';

@Riverpod(keepAlive: true)
AppDatabase db(Ref ref) {
  return throw UnimplementedError();
}

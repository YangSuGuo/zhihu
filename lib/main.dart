import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zhihu/Application.dart';
import 'package:zhihu/db/database/database.dart';
import 'package:zhihu/db/database/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  runApp(ProviderScope(overrides: [
    dbProvider.overrideWithValue(db),
  ], child: Application()));
}

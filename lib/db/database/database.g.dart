// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StarsDAO? _StarsDaoInstance;

  HistoryDAO? _HistoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stars` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `hint` TEXT, `url` TEXT, `image` TEXT, `gaPrefix` TEXT, `readingTime` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `history` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `hint` TEXT, `url` TEXT, `image` TEXT, `gaPrefix` TEXT, `readingTime` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StarsDAO get StarsDao {
    return _StarsDaoInstance ??= _$StarsDAO(database, changeListener);
  }

  @override
  HistoryDAO get HistoryDao {
    return _HistoryDaoInstance ??= _$HistoryDAO(database, changeListener);
  }
}

class _$StarsDAO extends StarsDAO {
  _$StarsDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _starsInsertionAdapter = InsertionAdapter(
            database,
            'stars',
            (Stars item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'hint': item.hint,
                  'url': item.url,
                  'image': item.image,
                  'gaPrefix': item.gaPrefix,
                  'readingTime': item.readingTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Stars> _starsInsertionAdapter;

  @override
  Future<List<Stars>> findAllSubjectsStars() async {
    return _queryAdapter.queryList(
        'SELECT * FROM stars ORDER BY readingTime DESC',
        mapper: (Map<String, Object?> row) => Stars(
            id: row['id'] as int?,
            title: row['title'] as String,
            hint: row['hint'] as String?,
            url: row['url'] as String?,
            image: row['image'] as String?,
            gaPrefix: row['gaPrefix'] as String?,
            readingTime: row['readingTime'] as String?));
  }

  @override
  Future<void> deleteStars(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM stars WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<bool?> selectStars(int id) async {
    return _queryAdapter.query(
        'SELECT EXISTS(SELECT 1 FROM stars WHERE id = ?1)',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<void> insertStars(Stars stars) async {
    await _starsInsertionAdapter.insert(stars, OnConflictStrategy.replace);
  }
}

class _$HistoryDAO extends HistoryDAO {
  _$HistoryDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _historyInsertionAdapter = InsertionAdapter(
            database,
            'history',
            (History item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'hint': item.hint,
                  'url': item.url,
                  'image': item.image,
                  'gaPrefix': item.gaPrefix,
                  'readingTime': item.readingTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<History> _historyInsertionAdapter;

  @override
  Future<List<Stars>> findAllSubjectsHistory() async {
    return _queryAdapter.queryList(
        'SELECT * FROM history ORDER BY readingTime DESC',
        mapper: (Map<String, Object?> row) => Stars(
            id: row['id'] as int?,
            title: row['title'] as String,
            hint: row['hint'] as String?,
            url: row['url'] as String?,
            image: row['image'] as String?,
            gaPrefix: row['gaPrefix'] as String?,
            readingTime: row['readingTime'] as String?));
  }

  @override
  Future<void> deleteAllSubjectsHistory() async {
    await _queryAdapter.queryNoReturn('DELETE FROM history');
  }

  @override
  Future<void> insertSubjectsHistory(History history) async {
    await _historyInsertionAdapter.insert(history, OnConflictStrategy.replace);
  }
}

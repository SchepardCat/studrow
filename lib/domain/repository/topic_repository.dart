import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/topic.dart';

class TopicRepository{
  static const _dbName = 'learny_word.db';
  static const _tableName = 'topic';


  static Future<Database>_database () async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  static Future<void> insert(Topic topic) async {
    final db = await _database();
    await db.insert(
      _tableName,
      topic.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Topic>> getTopic() async {
    final db = await _database();
    final List<Map<String, Object?>> topicMaps = await db.query(_tableName, orderBy: "name ASC");
    return [
      for (final {
      'id': id as int,
      'name': name as String,
      } in topicMaps)
        Topic(name: name),
    ];
  }
}
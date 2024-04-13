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
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY NOT NULL, name TEXT)',
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

  static Future<List<Topic>> getTopics() async {
    final db = await _database();
    final List<Map<String,Object?>> topicMaps = await db.query(_tableName, orderBy: "name ASC");
    return [
      for (final {
      'id': id as int,
      'name': name as String,
      } in topicMaps)
        Topic(id: id, name: name),
    ];
  }

  static Future<void> updateTopic(Topic topic) async {
    final db = await _database();
    await db.update(
      _tableName,
      topic.toMap(),
      where: 'id = ?',
      whereArgs: [topic.id],
    );
  }

  static Future<void> deleteTopic(int id) async {
    final db = await _database();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
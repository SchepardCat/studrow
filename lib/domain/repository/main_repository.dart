import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/topic.dart';
import '../model/word.dart';

class MainRepository {
  static const _dbName = 'learny_word.db';
  static const _tableNameTopic = 'topic';
  static const _tableNameWord = 'word';

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: _createDB,
      version: 1,
    );
    return database;
  }

  static Future _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE $_tableNameTopic(id_topic INTEGER PRIMARY KEY NOT NULL, name TEXT)');
    await db.execute('CREATE TABLE $_tableNameWord ('
        'id_word INTEGER PRIMARY KEY NOT NULL, '
        'name TEXT,'
        'translate TEXT,'
        'example TEXT,'
        'topic_id INTEGER,'
        'isLearn BOOLEAN,'
        'isRepeatFirst BOOLEAN,'
        'isRepeatSecond BOOLEAN,'
        'isRepeatThird BOOLEAN,'
        'FOREIGN KEY(topic_id) REFERENCES $_tableNameTopic(id_topic))');
  }

  //Word
  static Future<void> insertWord(Word word) async {
    final db = await _database();
    await db.insert(
      _tableNameWord,
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Word>> getWords(String name) async {
    name = '%' + name + '%';
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.query(_tableNameWord,
        where: 'name LIKE ?', whereArgs: [name], orderBy: "name ASC");
    return [
      for (final {
      'id_word': id as int,
      'name': name as String,
      'translate': translate as String,
      'example': example as String,
      'topic_id': topic_id as int,
      'isLearn': isLearn as int,
      'isRepeatFirst': isRepeatFirst as int,
      'isRepeatSecond': isRepeatSecond as int,
      'isRepeatThird': isRepeatThird as int,
      } in wordsMaps!)
        Word(id_word: id, name: name, translate: translate, example: example, topic_id: topic_id, isLearn: isLearn, isRepeatFirst: isRepeatFirst, isRepeatSecond: isRepeatSecond, isRepeatThird: isRepeatThird),
    ];
  }

  static Future<List<Word>> getWordsInTopic(int topic_id) async {
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.query(_tableNameWord,
        where: 'topic_id = ?', whereArgs: [topic_id], orderBy: "name ASC");
    return [
      for (final {
      'id_word': id as int,
      'name': name as String,
      'translate': translate as String,
      'example': example as String,
      'topic_id': topic_id as int,
      'isLearn': isLearn as int,
      'isRepeatFirst': isRepeatFirst as int,
      'isRepeatSecond': isRepeatSecond as int,
      'isRepeatThird': isRepeatThird as int,
      } in wordsMaps!)
        Word(id_word: id, name: name, translate: translate, example: example, topic_id: topic_id, isLearn: isLearn, isRepeatFirst: isRepeatFirst, isRepeatSecond: isRepeatSecond, isRepeatThird: isRepeatThird),
    ];
  }


  static Future<void> updateWord(Word word) async {
    final db = await _database();
    await db.update(
      _tableNameWord,
      word.toMap(),
      where: 'id_word = ?',
      whereArgs: [word.id_word],
    );
  }

  static Future<void> deleteWord(int id) async {
    final db = await _database();
    await db.delete(
      _tableNameWord,
      where: 'id_word = ?',
      whereArgs: [id],
    );
  }

  //Topic
  static Future<void> insert(Topic topic) async {
    final db = await _database();
    await db.insert(
      _tableNameTopic,
      topic.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Topic>> getTopics(String name) async {
    name = '%' + name + '%';
    final db = await _database();
    final List<Map<String, Object?>> topicMaps = await db.query(_tableNameTopic,
        where: 'name LIKE ?', whereArgs: [name], orderBy: "name ASC");
    return [
      for (final {
            'id_topic': id_topic as int,
            'name': name as String,
          } in topicMaps!)
        Topic(id_topic: id_topic, name: name),
    ];
  }

  static Future<void> updateTopic(Topic topic) async {
    final db = await _database();
    await db.update(
      _tableNameTopic,
      topic.toMap(),
      where: 'id_topic = ?',
      whereArgs: [topic.id_topic],
    );
  }

  static Future<void> deleteTopic(int id) async {
    final db = await _database();
    await db.delete(
      _tableNameTopic,
      where: 'id_topic = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Topic>> getTopic(int id) async {
    final db = await _database();
    final List<Map<String, Object?>> topicMaps = await db.query(_tableNameTopic,
        where: 'id_topic = ?', whereArgs: [id]);
    return [
      for (final {
      'id_topic': id_topic as int,
      'name': name as String,
      } in topicMaps!)
        Topic(id_topic: id_topic, name: name),
    ];
  }

}

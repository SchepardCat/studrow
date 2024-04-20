import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/topic.dart';
import '../model/word.dart';

class MainRepository {
  static const _dbName = 'learny_word.db';
  static const _tableNameTopic = 'topic';
  static const _tableNameWord = 'word';
  static int i = 20;

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


  //TestData
  static Future<void> insertTestWords(int number) async {
    number = number + i;
    final db = await _database();
    for(i; i < number; i++){
      await db.execute(
          "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'testData + $i','testData + $i','testData + $i', 1, 0, 0, 0, 0]
      );
      print("Add $i test data");
    }
  }







  //Repeat
  static Future<int?> getCountRepetition(int isLearn, int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    final db = await _database();
    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $_tableNameWord '
        'WHERE isLearn = ? AND isRepeatFirst = ? AND isRepeatSecond = ? AND isRepeatThird = ?;',
        [isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird]));
    await db.close();
    return count;
  }
  static Future<List<Word>> getWordsListRepetition(int isLearn, int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    //Запрос для рандомних слів
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery(
        "SELECT "
            "*,"
            "(SELECT topic.name FROM topic WHERE id_topic = topic_id) as topic_name "
            "FROM $_tableNameWord WHERE isLearn = ? AND isRepeatFirst = ? AND "
            "isRepeatSecond = ? AND isRepeatThird = ? ORDER BY random();", [isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird]);
    return [
      for (final {
      'id_word': id as int,
      'name': name as String,
      'translate': translate as String,
      'example': example as String,
      'topic_id': topic_id as int,
      'topic_name' : topic_name as String,
      'isLearn': isLearn as int,
      'isRepeatFirst': isRepeatFirst as int,
      'isRepeatSecond': isRepeatSecond as int,
      'isRepeatThird': isRepeatThird as int,
      } in wordsMaps!)
        Word(id_word: id, name: name, translate: translate, example: example, topic_id: topic_id, topic_name: topic_name, isLearn: isLearn, isRepeatFirst: isRepeatFirst, isRepeatSecond: isRepeatSecond, isRepeatThird: isRepeatThird),
    ];
  }









  //Word
  static Future<void> insertWord(Word word) async {
    final db = await _database();
    await db.insert(
      _tableNameWord,
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
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

  static Future<List<Word>> getWordsInTopicDontLearn(int topic_id) async {
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery(
        "SELECT "
            "*,"
            "(SELECT topic.name FROM topic WHERE id_topic = topic_id) as topic_name "
            "FROM $_tableNameWord WHERE topic_id = ? AND isLearn = ?;", [topic_id, 0]);
    return [
      for (final {
      'id_word': id as int,
      'name': name as String,
      'translate': translate as String,
      'example': example as String,
      'topic_id': topic_id as int,
      'topic_name' : topic_name as String,
      'isLearn': isLearn as int,
      'isRepeatFirst': isRepeatFirst as int,
      'isRepeatSecond': isRepeatSecond as int,
      'isRepeatThird': isRepeatThird as int,
      } in wordsMaps!)
        Word(id_word: id, name: name, translate: translate, example: example, topic_id: topic_id, topic_name: topic_name, isLearn: isLearn, isRepeatFirst: isRepeatFirst, isRepeatSecond: isRepeatSecond, isRepeatThird: isRepeatThird),
    ];
  }

  static Future<List<Word>> getWordsRandomStudy() async {
    //Запрос для рандомних слів
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery(
        "SELECT "
            "*,"
            "(SELECT topic.name FROM topic WHERE id_topic = topic_id) as topic_name "
        "FROM $_tableNameWord WHERE isLearn = 0 ORDER BY random() LIMIT 10;");
    return [
      for (final {
      'id_word': id as int,
      'name': name as String,
      'translate': translate as String,
      'example': example as String,
      'topic_id': topic_id as int,
      'topic_name' : topic_name as String,
      'isLearn': isLearn as int,
      'isRepeatFirst': isRepeatFirst as int,
      'isRepeatSecond': isRepeatSecond as int,
      'isRepeatThird': isRepeatThird as int,
      } in wordsMaps!)
        Word(id_word: id, name: name, translate: translate, example: example, topic_id: topic_id, topic_name: topic_name, isLearn: isLearn, isRepeatFirst: isRepeatFirst, isRepeatSecond: isRepeatSecond, isRepeatThird: isRepeatThird),
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

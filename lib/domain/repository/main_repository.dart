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

  //initial
  static Future _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_tableNameTopic(id_topic INTEGER PRIMARY KEY NOT NULL, name TEXT)');
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

    await insertTopics(db);
    await insertTestWords(db);
  }

  static Future<void> insertTestWords(Database db) async {
    //Eating
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'a cake', 'торт', 'Do you want some cake?', 1, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, '(a) banana', 'банан', 'I have three bananas', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a cookie(Am)/a biscuit(Br)',
          'печиво',
          'Children like cookies/ biscuits',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a fish', 'риба', 'i don`t eat fish', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a fruit',
          'фрукт',
          'What is your favorite fruit?',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a meal', 'їжа/страва', 'Enjoy your meal', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a potato',
          'картопля',
          'His son often eats potatoes',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a sandwich',
          'бутерброд, сендвіч',
          'Have a sandwich!',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a tomato',
          'помідор',
          'Do you like tomato juice?',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a vegetable',
          'овоч',
          'Salt the vegetables, please',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'an apple',
          'яблуко',
          'Do you want a green or a red apple',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'an egg', 'яйце', 'I have eggs for breakfast', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a coffee', 'кава', 'white coffee', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'chocolate', 'шоколад', 'milk chocolate', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'cheese', 'сир', 'cottage cheese', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'butter',
          'масло',
          'I need butter for this meal',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'breakfast',
          'сніданок',
          'What do you have for breakfast',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'bread', 'хліб', 'bread and butter', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'beer', 'пиво', 'Let`s have a beer', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'an orange',
          'апельсин',
          'Can you buy me an orange?',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a sweet', 'цукерка', 'sweets', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a sugar',
          'овоч',
          'Do you take sugar in your tea?',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'soup', 'суп', 'I can make chicken soup', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'rise',
          'рис',
          'We had rice and fish for dinner',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'milk', 'молоко', 'Give me a glass of milk', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'meat', 'м`ясо', 'I don`t eat meat', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'lunch', 'обід', 'What`is for lunch', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'juice', 'сік', 'orange juice', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'food', 'їжа', 'light food', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'dinner',
          'вечеря',
          'The dinner was really good',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'tea', 'чай', 'I am making tea for my friends', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'to cook/a cook/a cooker',
          'готувати/кухар/плита',
          '',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'to drink(drank-drunk)/a drink',
          'пити/напій',
          'Have a drink!',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'to eat(ate-eaten)',
          'їсти',
          'She doesn`t eat well',
          1,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'to salt/salt/salty', 'солити/сіль/солоний', '', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'water', 'вода', 'There is no hot water', 1, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'wine', 'вино', 'white wine', 1, 0, 0, 0, 0]);

    //Home
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a bath/a bathroom',
          'ванна/ванна кімната',
          'to have a bath',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a bed', 'ліжко', 'I am going to bed', 2, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a bedroom', 'спальня', 'We have a big bedroom', 2, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a chair/an armchair',
          'крісло, стілець/м`яке крісло',
          'Your jacket is on the chair',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a cup',
          'чашка',
          'I would like to drink a cup of coffee',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a door/a door phone',
          'двері/домофон',
          'Don`t forget to close the door!',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a flat',
          'квартира, помешкання',
          'I live in a small flat',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a floor', 'поверх, підлога', 'a ground floor', 2, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [null, 'a glass', 'склянка', 'a wine glass', 2, 0, 0, 0, 0]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a house',
          'будинок',
          'They live in that blue house',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a key',
          'ключ',
          'Give me a key to this door, please',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a kitchen',
          'кухня',
          'You have a very large kitchen',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a knife/knifes',
          'ніж/ножі',
          'Give me a bread knife, please',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a newspaper/a paper',
          'газета/газета',
          'I read this newspaper yesterday',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a plate',
          'тарілка',
          'a soup plate',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a refregirator/a fridge',
          'холодильник/холодильник',
          'Put the butter in the fridge',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a room',
          'кімната, приміщення',
          'a living room',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a shower',
          'душ',
          'I am having a shower',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a table',
          'стіл',
          'a coffee table',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a toilet',
          'туалет',
          'Where is the toilet?',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute(
        "INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [
          null,
          'a wall',
          'стіна, мур',
          'The picture is on the wall',
          2,
          0,
          0,
          0,
          0
        ]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'a window', 'вікно', 'Please, close the window!', 2, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'a home', 'дім', 'i am going home', 2, 0, 0, 0, 0]);

    //Everyday Life
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'noise (a)/noisy', 'шум/шумний', 'Don`t make a noise!', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'clean (to)/clean', 'чистити, прибирати/чистий', 'I am cleaning the windows now', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'come (to)(came-come)', 'приходити, приїзжати', 'Where do you come from?', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'get(to)(got-gotten)', 'отримати, дістатись', 'How can i get there?', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'give (to)(gave-given)', 'давати', 'Give me some time', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'go (to)(went-gone)', 'їхати, йти', 'I am going to work', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'make (to)(made-made)', 'робити', 'Can you make me some coffee?', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'put (to)(put-put)', 'ставити, класти', 'Put the hat on', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'sit (so)(sat-sat)', 'сидіти', 'Sit down', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'sleep (to)(slept-slept)/sleep', 'спати/сон', 'I am going to sleep!', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'take (to)(took-taken)', 'брати, приймати', 'Take a pen with you!', 3, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'wash (to)', 'мити', 'I washed my hands', 3, 0, 0, 0, 0]);

    //Good & Services
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'bar (a)', 'бар', 'That bar is closed today', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'cafe (a)', 'кафе, кав`ярня', 'Let`s go to a cafe', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'restaurant (a)', 'ресторан', 'They had supper at the restaurant', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'shop (a)', 'магазин', 'a shop window', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'shopping', 'покупки', 'We go shopping together', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'buy (to)(bought-bought)', 'купувати', 'Will you buy some cheese?', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'choose (to)(chose-chosen)', 'вибирати', 'It`s difficuit to choose', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'close (to)/closed', 'замикати/зачинений', 'The museum is closed', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'need (to)', 'потребувати', 'I need to go shopping', 4, 0, 0, 0, 0]);
    await db.execute("INSERT INTO $_tableNameWord(id_word,name, translate, example, topic_id, isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", [null, 'open (to)/open', 'відчиняти/відчинений', 'Who opened the door?', 4, 0, 0, 0, 0]);




  }
  static Future<void> insertTopics(Database db) async {
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Eating"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) VALUES (?, ?);",
        [null, "Home"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Everyday Life"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Good & Services"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Family"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Appearance"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Emotions"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Health"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Weather & Nature"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Science & Education"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Culture & Art"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Religion"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Time"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Measures"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Things"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Substance & Materials"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Sport & Leisure"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Travelling"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Movement & Position"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Transport"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "City"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Countryside"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Communication"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Media"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Work"]);
    await db.execute(
        "INSERT INTO $_tableNameTopic(id_topic,name) "
        "VALUES (?, ?);",
        [null, "Economy"]);
  }

  //Repeat
  static Future<int?> getCountRepetition(int isLearn, int isRepeatFirst,
      int isRepeatSecond, int isRepeatThird) async {
    final db = await _database();
    int? count = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) FROM $_tableNameWord '
        'WHERE isLearn = ? AND isRepeatFirst = ? AND isRepeatSecond = ? AND isRepeatThird = ?;',
        [isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird]));
    await db.close();
    return count;
  }

  static Future<List<Word>> getWordsListRepetition(int isLearn,
      int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    //Запрос для рандомних слів
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery(
        "SELECT "
        "*,"
        "(SELECT topic.name FROM topic WHERE id_topic = topic_id) as topic_name "
        "FROM $_tableNameWord WHERE isLearn = ? AND isRepeatFirst = ? AND "
        "isRepeatSecond = ? AND isRepeatThird = ? ORDER BY random();",
        [isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird]);
    return [
      for (final {
            'id_word': id as int,
            'name': name as String,
            'translate': translate as String,
            'example': example as String,
            'topic_id': topic_id as int,
            'topic_name': topic_name as String,
            'isLearn': isLearn as int,
            'isRepeatFirst': isRepeatFirst as int,
            'isRepeatSecond': isRepeatSecond as int,
            'isRepeatThird': isRepeatThird as int,
          } in wordsMaps!)
        Word(
            id_word: id,
            name: name,
            translate: translate,
            example: example,
            topic_id: topic_id,
            topic_name: topic_name,
            isLearn: isLearn,
            isRepeatFirst: isRepeatFirst,
            isRepeatSecond: isRepeatSecond,
            isRepeatThird: isRepeatThird),
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
    List<Map<String, Object?>> wordsMaps = await db.query(_tableNameWord,
        where: 'name LIKE ?', whereArgs: [name], orderBy: "name ASC");
    if (wordsMaps.isEmpty) {
      wordsMaps = await db.query(_tableNameWord,
          where: 'translate LIKE ?', whereArgs: [name], orderBy: "name ASC");
    }
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
        Word(
            id_word: id,
            name: name,
            translate: translate,
            example: example,
            topic_id: topic_id,
            isLearn: isLearn,
            isRepeatFirst: isRepeatFirst,
            isRepeatSecond: isRepeatSecond,
            isRepeatThird: isRepeatThird),
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
        Word(
            id_word: id,
            name: name,
            translate: translate,
            example: example,
            topic_id: topic_id,
            isLearn: isLearn,
            isRepeatFirst: isRepeatFirst,
            isRepeatSecond: isRepeatSecond,
            isRepeatThird: isRepeatThird),
    ];
  }

  static Future<List<Word>> getWordsInTopicDontLearn(int topic_id) async {
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery(
        "SELECT "
        "*,"
        "(SELECT topic.name FROM topic WHERE id_topic = topic_id) as topic_name "
        "FROM $_tableNameWord WHERE topic_id = ? AND isLearn = ?;",
        [topic_id, 0]);
    return [
      for (final {
            'id_word': id as int,
            'name': name as String,
            'translate': translate as String,
            'example': example as String,
            'topic_id': topic_id as int,
            'topic_name': topic_name as String,
            'isLearn': isLearn as int,
            'isRepeatFirst': isRepeatFirst as int,
            'isRepeatSecond': isRepeatSecond as int,
            'isRepeatThird': isRepeatThird as int,
          } in wordsMaps!)
        Word(
            id_word: id,
            name: name,
            translate: translate,
            example: example,
            topic_id: topic_id,
            topic_name: topic_name,
            isLearn: isLearn,
            isRepeatFirst: isRepeatFirst,
            isRepeatSecond: isRepeatSecond,
            isRepeatThird: isRepeatThird),
    ];
  }

  static Future<List<Word>> getWordsRandomStudy() async {
    //Запрос для рандомних слів
    final db = await _database();
    final List<Map<String, Object?>> wordsMaps = await db.rawQuery("SELECT "
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
            'topic_name': topic_name as String,
            'isLearn': isLearn as int,
            'isRepeatFirst': isRepeatFirst as int,
            'isRepeatSecond': isRepeatSecond as int,
            'isRepeatThird': isRepeatThird as int,
          } in wordsMaps!)
        Word(
            id_word: id,
            name: name,
            translate: translate,
            example: example,
            topic_id: topic_id,
            topic_name: topic_name,
            isLearn: isLearn,
            isRepeatFirst: isRepeatFirst,
            isRepeatSecond: isRepeatSecond,
            isRepeatThird: isRepeatThird),
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
    final List<Map<String, Object?>> topicMaps =
        await db.query(_tableNameTopic, where: 'id_topic = ?', whereArgs: [id]);
    return [
      for (final {
            'id_topic': id_topic as int,
            'name': name as String,
          } in topicMaps!)
        Topic(id_topic: id_topic, name: name),
    ];
  }
}

class Word{
  int? id_word;
  String name;
  String translate;
  String example;
  int? topic_id;
  int isLearn;
  int isRepeatFirst;
  int isRepeatSecond;
  int isRepeatThird;


  Word({this.id_word,required this.name, required this.translate,  required this.example, this.topic_id, required this.isLearn, required  this.isRepeatFirst, required  this.isRepeatSecond, required this.isRepeatThird});

  Map<String,Object?> toMap() {
    return {
      'id_word': id_word,
      'name': name,
      'translate': translate,
      'example': example,
      'topic_id': topic_id,
      'isLearn': isLearn,
      'isRepeatFirst': isRepeatFirst,
      'isRepeatSecond': isRepeatSecond,
      'isRepeatThird' : isRepeatThird,
    };
  }

  @override
  String toString() {
    return 'Word{id: $id_word, name: $name, translate: $translate, example: $example,'
        'topic_id: $topic_id, isLearn: $isLearn, isRepeatFirst: $isRepeatFirst, isRepeatSecond: $isRepeatSecond,'
        'isRepeatThird: $isRepeatThird}';
  }

}
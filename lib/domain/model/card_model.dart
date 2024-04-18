import 'package:studrow/domain/model/word.dart';

class CardModel{
  final String number;
  final String topic;
  final String word;
  final String translate;
  final String example;
  final Word wordOb;

  CardModel({required this.number, required this.topic, required this.word,
      required this.translate, required this.example, required this.wordOb});
}
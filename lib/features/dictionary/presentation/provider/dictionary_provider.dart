import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/domain/repository/main_repository.dart';

class WordProvider with ChangeNotifier{
  String search = "";
  //
  //Dictionary list
  List<Word> words = [];
  bool isLoadingWord = true;
  //
  //List word in topic
  List<Word> wordsInTopic = [];
  bool isLoadingWordInTopicList = true;
  //

  WordProvider(){
    getWords();
  }


  setSearch({required String query}){
    this.search = query;
    getWords();
  }

  getWords() async {
    words = await MainRepository.getWords(search);
    isLoadingWord = false;
    notifyListeners();
  }

  insertWord({required Word word}) async {
    await MainRepository.insertWord(word);
    getWords();
  }

  updateWord({required Word word}) async {
    await MainRepository.updateWord(word);
    getWords();
  }

  deleteWord({required int id}) async {
    await MainRepository.deleteWord(id);
    getWords();
  }

  getWordsInTopic({required int topic_id}) async {
    wordsInTopic = await MainRepository.getWordsInTopic(topic_id);
    isLoadingWordInTopicList = false;
    notifyListeners();
  }


  //Account_provider
  insertTestWords(int number) async {
    await MainRepository.insertTestWords(number);
    getWords();
  }


}
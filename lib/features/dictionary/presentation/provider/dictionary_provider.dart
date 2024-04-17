import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/domain/repository/main_repository.dart';

class WordProvider with ChangeNotifier{
  List<Word> words = [];
  List<Word> wordsInTopic = [];
  //study card list
  List<Word> wordsForStudy = [];
  bool isLoadingListWordForRandom = true;
  //
  String search = "";
  bool isLoadingWord = true;
  bool isLoadingWordInTopicList = true;

  WordProvider(){
    getWords();
  }

  setSearch({required String query}){
    this.search = query;
    getWords();
  }

  getWords() async {
    words = await MainRepository.getWords(search);
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

  getWordsRandomStudy() async {
    wordsForStudy = await MainRepository.getWordsRandomStudy();
    isLoadingListWordForRandom = false;
    notifyListeners();
  }

}
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
  //study card list
  List<Word> wordsForStudy = [];
  bool isLoadingListWordForRandom = true;
  //
  //study card list by topic
  List<Word> wordsForStudyByTopic = [];
  bool isLoadingListWordByTopic = true;
  //
  //list first repeating words
  List<Word> wordsFirstRepetition = [];
  int? isLoadingListFirstRepetition;
  //
  //list second repeating words
  List<Word> wordsSecondRepetition = [];
  bool isLoadingListSecondRepetition = true;
  //
  //list third repeating words
  List<Word> wordsThirdRepetition = [];
  bool isLoadingListThirdRepetition = true;
  //

  WordProvider(){
    getWords();
    getRepeatFilled();
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

  getWordsInTopicDontLearn({required int topic_id}) async {
    wordsForStudyByTopic = await MainRepository.getWordsInTopicDontLearn(topic_id);
    isLoadingListWordByTopic = false;
    notifyListeners();
  }

  insertTestWords(int number) async {
    await MainRepository.insertTestWords(number);
    getWords();
  }

  getRepeatFilled() async {
    final isLoadingListFirstRepetition = await MainRepository.getCountRepetition(1,0,0,0);
    final isLoadingListSecondRepetition = await MainRepository.getCountRepetition(1,1,0,0);
    final isLoadingListThirdRepetition = await MainRepository.getCountRepetition(1,1,1,0);
    print(isLoadingListFirstRepetition);
    print(isLoadingListSecondRepetition);
    print(isLoadingListThirdRepetition);
  }
}
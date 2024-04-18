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
  //list repetition words
  bool isLoadingRepetition = true;
  bool isLoadingWordsListRepetition = true;
  List<Word> wordsListRepetition = [];
  //
  //list first repetition words
  int? isLoadingListFirstRepetition;
  bool isLoadingFirstList = true;
  //
  //list second repetition words
  int? isLoadingListSecondRepetition;
  bool isLoadingSecondList = true;
  //
  //list third repetition words
  int? isLoadingListThirdRepetition;
  bool isLoadingThirdList = true;
  //

  WordProvider(){
    getWords();
    //getRepeatFilled();
  }


  setSearch({required String query}){
    this.search = query;
    getWords();
  }

  getWords() async {
    words = await MainRepository.getWords(search);
    isLoadingListFirstRepetition = await MainRepository.getCountRepetition(1,0,0,0);
    isLoadingListSecondRepetition = await MainRepository.getCountRepetition(1,1,0,0);
    isLoadingListThirdRepetition = await MainRepository.getCountRepetition(1,1,1,0);
    isLoadingRepetition = false;
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
    isLoadingListFirstRepetition = await MainRepository.getCountRepetition(1,0,0,0);
    isLoadingListSecondRepetition = await MainRepository.getCountRepetition(1,1,0,0);
    isLoadingListThirdRepetition = await MainRepository.getCountRepetition(1,1,1,0);
    isLoadingRepetition = false;
    notifyListeners();
  }

  getRepeatWordsList(int isLearn, int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    wordsListRepetition =  await MainRepository.getWordsListRepetition(isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird);
    isLoadingWordsListRepetition = false;
    if(isLearn == 1 && isRepeatFirst == 0 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingFirstList = false;
    }
    if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingSecondList = false;
    }
    if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 1 && isRepeatThird == 0){
      isLoadingThirdList = false;
    }
    notifyListeners();
  }
}
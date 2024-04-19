import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/domain/repository/main_repository.dart';

class StudyProvider with ChangeNotifier{
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
  int? countFirstRepetition;
  bool isLoadingFirstListCount = true;
  //
  //list second repetition words
  int? countSecondRepetition;
  bool isLoadingSecondListCount = true;
  //
  //list third repetition words
  int? countThirdRepetition;
  bool isLoadingThirdListCount = true;
  //

  StudyProvider(){
    getRepeatFilled();
  }

  insertWord({required Word word}) async {
    await MainRepository.insertWord(word);
  }

  updateWord({required Word word}) async {
    await MainRepository.updateWord(word);
  }

  deleteWord({required int id}) async {
    await MainRepository.deleteWord(id);
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
  }

  getRepeatFilled() async {
    countFirstRepetition = await MainRepository.getCountRepetition(1,0,0,0);
    countSecondRepetition = await MainRepository.getCountRepetition(1,1,0,0);
    countThirdRepetition = await MainRepository.getCountRepetition(1,1,1,0);
    isLoadingRepetition = false;
    print(countFirstRepetition);
    print(countSecondRepetition);
    print(countThirdRepetition);
    notifyListeners();
  }

  getRepeatWordsList(int isLearn, int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    wordsListRepetition =  await MainRepository.getWordsListRepetition(isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird);
    isLoadingWordsListRepetition = false;
    if(isLearn == 1 && isRepeatFirst == 0 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingFirstListCount = false;
    }
    if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingSecondListCount = false;
    }
    if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 1 && isRepeatThird == 0){
      isLoadingThirdListCount = false;
    }
    notifyListeners();
  }
}
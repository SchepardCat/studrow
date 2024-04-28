import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/model/topic.dart';
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

  //Search Topic bug fix
  List<Topic> topics = [];
  String search = "";
  bool isLoadingTopicPage = true;

  setSearch({required String query}){
    this.search = query;
    getTopics();
  }

  getTopics() async {
    topics = await MainRepository.getTopics(search);
    isLoadingTopicPage = false;
    notifyListeners();
  }
  //Search Topic bug fix


  StudyProvider(){
    getRepeatFilled();
    getTopics();
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


  getRepeatFilled() async {
    countFirstRepetition = await MainRepository.getCountRepetition(1,0,0,0);
    countSecondRepetition = await MainRepository.getCountRepetition(1,1,0,0);
    countThirdRepetition = await MainRepository.getCountRepetition(1,1,1,0);
    isLoadingRepetition = false;
    notifyListeners();
  }

  getRepeatWordsList(int isLearn, int isRepeatFirst, int isRepeatSecond, int isRepeatThird) async {
    isLoadingFirstListCount = true;
    isLoadingSecondListCount = true;
    isLoadingThirdListCount = true;
    isLoadingWordsListRepetition = true;
    wordsListRepetition =  await MainRepository.getWordsListRepetition(isLearn, isRepeatFirst, isRepeatSecond, isRepeatThird);
    isLoadingWordsListRepetition = false;
    if(isLearn == 1 && isRepeatFirst == 0 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingFirstListCount = false;
    }else if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 0 && isRepeatThird == 0){
      isLoadingFirstListCount = false;
      isLoadingSecondListCount = false;
    }else if(isLearn == 1 && isRepeatFirst == 1 && isRepeatSecond == 1 && isRepeatThird == 0){
      isLoadingFirstListCount = false;
      isLoadingSecondListCount = false;
      isLoadingThirdListCount = false;
    }
    notifyListeners();
  }
}
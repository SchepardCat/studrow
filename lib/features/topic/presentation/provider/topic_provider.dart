import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/repository/main_repository.dart';

import '../../../../domain/model/topic.dart';

class TopicProvider with ChangeNotifier{
  List<Topic> topics = [];
  List<Topic> topic = [];
  String search = "";
  bool isLoadingTopics = true;
  bool isLoadingTopicInformation = true;

  TopicProvider(){
    getTopics();
  }

  setSearch({required String query}){
    this.search = query;
    getTopics();
  }

  getTopics() async {
    topics = await MainRepository.getTopics(search);
    isLoadingTopics = false;
    notifyListeners();
  }

  insertTopic({required Topic topic}) async {
    await MainRepository.insert(topic);
    getTopics();
  }

  update({required Topic topic}) async {
    await MainRepository.updateTopic(topic);
    getTopics();
  }

  delete({required int id}) async {
    await MainRepository.deleteTopic(id);
    getTopics();
  }

  getTopic(int id) async {
    topic = await MainRepository.getTopic(id);
    isLoadingTopicInformation = false;
    notifyListeners();
  }
}
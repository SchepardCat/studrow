import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/repository/topic_repository.dart';

import '../../../../domain/model/topic.dart';

class TopicProvider with ChangeNotifier{
  List<Topic> topics = [];
  String search = "";

  TopicProvider(){
    getTopics();
  }

  setSearch({required String query}){
    this.search = query;
    getTopics();
  }

  getTopics() async {
    topics = await TopicRepository.getTopics(search);
    notifyListeners();
  }

  insertTopic({required Topic topic}) async {
    await TopicRepository.insert(topic);
    getTopics();
  }

  update({required Topic topic}) async {
    await TopicRepository.updateTopic(topic);
    getTopics();
  }

  delete({required int id}) async {
    await TopicRepository.deleteTopic(id);
    getTopics();
  }

}
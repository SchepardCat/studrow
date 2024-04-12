import 'package:flutter/cupertino.dart';
import 'package:studrow/domain/repository/topic_repository.dart';

import '../../../../domain/model/topic.dart';

class TopicProvider with ChangeNotifier{
  List<Topic> topics = [];

  TopicProvider(){
    getTopics();
  }

  getTopics() async {
    topics = await TopicRepository.getTopic();
    notifyListeners();
  }

  insertTopic({required Topic topic}) async {
    await TopicRepository.insert(topic);
    getTopics();
  }

  update({required Topic topic}) async {
    await TopicRepository.insert(topic);
    getTopics();
  }

}
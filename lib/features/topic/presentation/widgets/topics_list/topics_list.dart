import 'package:flutter/material.dart';
import 'package:studrow/domain/model/topic.dart';


import 'topic_item_list.dart';


class TopicsList extends StatefulWidget {
  const TopicsList({super.key});

  @override
  State<TopicsList> createState() => _TopicsListState();
}

class _TopicsListState extends State<TopicsList> {
  final List<String> entries = Topic().listTopics;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return TopicItemList(listData: entries, index: index);
      },
    );
  }
}

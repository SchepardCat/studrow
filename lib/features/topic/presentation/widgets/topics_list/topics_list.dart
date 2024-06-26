import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/domain/repository/main_repository.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:studrow/assets/constants.dart' as Const;


import 'topic_item_list.dart';


class TopicsList extends StatefulWidget {
  const TopicsList({super.key});

  @override
  State<TopicsList> createState() => _TopicsListState();
}

class _TopicsListState extends State<TopicsList> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopicProvider>(
        builder: (context, provider, child) {
          return provider.topics.isEmpty? const Center(child: Text(Const.TOPICS_EMPTY)):
              ListView(
                children: provider.topics.map((e) => TopicItemList(topic: e)).toList());
        },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studrow/features/topic/presentation/widgets/search/topic_search.dart';
import 'package:studrow/features/topic/presentation/widgets/topics_list/topics_list.dart';
import '../../../dictionary/presentation/widgets/search/dictionary_search.dart';

class TopicsPageBody extends StatelessWidget {
  const TopicsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TopicSearch(),
            Expanded(child: TopicsList()),
          ],
        ),
      ),
    );
  }
}


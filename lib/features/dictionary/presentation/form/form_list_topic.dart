import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/form/form_item_list_topic.dart';

import '../../../topic/presentation/provider/topic_provider.dart';

class TopicListPage extends StatefulWidget {
  const TopicListPage({super.key});

  @override
  State<TopicListPage> createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {
  int topic_id = 0;
  bool valueChange = false;
  bool isChange = true;

  @override
  void initState() {
    if (valueChange){
      isChange = false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose topic',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                IconButton(onPressed: onPressed, icon: Icon(Icons.done)),
              ],
            ),
            Expanded(
              child: Consumer<TopicProvider>(
                builder: (context, provider, child) {
                  return provider.topics.isEmpty? const Center(child: Text("Empty")):
                  ListView(
                      children: provider.topics.map((e) => ItemTopicListPage(topic: e)).toList());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
  }
}

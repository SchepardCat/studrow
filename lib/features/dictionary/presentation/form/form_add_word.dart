import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/features/dictionary/presentation/form/form_list_topic.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/router/router.dart';

import '../../../../domain/model/topic.dart';
import '../../../topic/presentation/provider/topic_provider.dart';

@RoutePage()
class WordFormAddPage extends StatefulWidget {
  const WordFormAddPage({super.key});

  @override
  State<WordFormAddPage> createState() => _WordFormAddPageState();
}

class _WordFormAddPageState extends State<WordFormAddPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _translate = TextEditingController();
  final TextEditingController _example = TextEditingController();
  final TextEditingController _topic = TextEditingController();
  Topic? selectedTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new word"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 32,
              icon: const Icon(Icons.done),
              onPressed: () {
                Navigator.pop(context, true);
                _insertTopic();
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'new word',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _translate,
                decoration: InputDecoration(
                  hintText: 'translation',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                maxLines: 4,
                controller: _example,
                decoration: InputDecoration(
                  hintText: 'example',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Consumer<TopicProvider>(
                builder: (context, provider, child) {
                  return provider.topics.isEmpty? const Center(child: Text("Empty")):
                  DropdownMenu<Topic>(
                    controller: _topic,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    leadingIcon: const Icon(Icons.search),
                    label: const Text("Topic"),
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    ),
                    onSelected: (Topic? topic) {
                      setState(() {
                        selectedTopic = topic;
                      });
                    },
                    dropdownMenuEntries:
                    provider.topics.map<DropdownMenuEntry<Topic>>(
                          (Topic topic) {
                        return DropdownMenuEntry<Topic>(
                          value: topic,
                          label: topic.name,
                          leadingIcon: Text(topic.id_topic.toString())
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _insertTopic() async {
    final Word word = Word(
      name: _name.text,
      translate: _translate.text,
      example: _example.text,
      topic_id: 1,
      isLearn: 0,
      isRepeatFirst: 0,
      isRepeatSecond: 0,
      isRepeatThird: 0
    );
    Provider.of<WordProvider>(context, listen: false).insertWord(word: word);
    print("Insert word complete");
  }
}


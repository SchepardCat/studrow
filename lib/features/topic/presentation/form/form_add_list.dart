import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/domain/repository/topic_repository.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';

class listFormAdd extends StatefulWidget {
  const listFormAdd({super.key});

  @override
  State<listFormAdd> createState() => _listFormAddState();
}

class _listFormAddState extends State<listFormAdd> {
  final _nameTopic = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "Add new list",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: TextField(
                    controller: _nameTopic,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name of new list",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton.tonal(
                      onPressed: (){
                        print("Cancel button form add");
                        Navigator.pop(context, true);
                      },
                      child: const Text('Cancel'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: (){
                        Navigator.pop(context, true);
                        _insertTopic();
                      },
                      child: const Text('Add'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _insertTopic() async {
    final Topic topic = Topic(name: _nameTopic.text);
    Provider.of<TopicProvider>(context, listen: false).insertTopic(topic: topic);
    print("Insert complete");
  }
}

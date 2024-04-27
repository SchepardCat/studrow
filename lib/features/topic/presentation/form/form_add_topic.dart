import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/features/study/presentation/widgets/snap_message/snap_message.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:studrow/assets/constants.dart' as Const;

class TopicFormAdd extends StatefulWidget {
  const TopicFormAdd({super.key});

  @override
  State<TopicFormAdd> createState() => _TopicFormAddState();
}

class _TopicFormAddState extends State<TopicFormAdd> {
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
                  Const.TOPIC_ADD_FORM_TITLE,
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
                      hintText: Const.TOPIC_ADD_FORM_FIELD_TITLE,
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
                      child: const Text(Const.TOPIC_ADD_FORM_BUTTON_CANCEL),
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
                      child: const Text(Const.TOPIC_ADD_FORM_BUTTON_ADD),
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
    //logging transaction
    //
    //
    FlashMessage(messageShort: "Done!",messageLong:  "Topic " + topic.name + " add.",colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
  }

}

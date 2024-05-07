import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studrow/assets/constants.dart' as Const;
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/features/study/presentation/widgets/snap_message/snap_message.dart';

import '../provider/topic_provider.dart';

class DialogDeleteTopic extends StatefulWidget {
  final Topic topic;
  const DialogDeleteTopic({super.key, required this.topic});

  @override
  State<DialogDeleteTopic> createState() => _DialogDeleteTopicState();
}

class _DialogDeleteTopicState extends State<DialogDeleteTopic> {

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
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      Const.TOPIC_DELETE_DIALOG_TITLE,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton.tonal(
                      onPressed: () {
                        print("Cancel button form add");
                        Navigator.pop(context, true);
                      },
                      child: Text(Const.TOPIC_DELETE_DIALOG_FIELD_CANCEL),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: () {
                        print("Delete topic and words");
                        _deleteTopicAndWord();
                      },
                      child: const Text(Const.TOPIC_DELETE_DIALOG_FIELD_DELETE),
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

  _deleteTopicAndWord() async {
    print("Delete all");
    final List<Word> words = Provider.of<WordProvider>(context, listen: false).wordsInTopic;
    if (words.isNotEmpty) {
      for (final word in words){
        await Provider.of<WordProvider>(context, listen: false).deleteWord(id: word.id_word!);
      }
      await Provider.of<TopicProvider>(context, listen: false).delete(id: widget.topic.id_topic!);
      Provider.of<TopicProvider>(context, listen: false).setDeleteTopicAndWords();
      Navigator.pop(context, true);
      FlashMessage(
          messageShort: Const.TOPIC_MESSAGE_SHORT_DELETE,
          messageLong: Const.TOPIC_MESSAGE_LONG_DELETE,
          colorMessage: Theme.of(context).colorScheme.primaryContainer)
          .getScaffoldMessage(context);
    }
  }
}

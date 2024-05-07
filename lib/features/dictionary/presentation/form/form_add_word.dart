import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/features/dictionary/presentation/form/form_list_topic.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/router/router.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../domain/model/topic.dart';
import '../../../study/presentation/widgets/snap_message/snap_message.dart';
import '../../../topic/presentation/provider/topic_provider.dart';
import 'package:studrow/assets/constants.dart' as Const;

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
  int? selectedIdTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(Const.DICTIONARY_ADD_FORM_TITLE),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 32,
              icon: const Icon(Icons.done),
              onPressed: () {
                _insertTopic();
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Consumer<TopicProvider>(
                      builder: (context, provider, child) {
                        return provider.topics.isEmpty? const Center(child: Text(Const.TOPICS_EMPTY)):
                        DropdownMenu<Topic>(
                          width: (MediaQuery.of(context).size.width/2 + 50),
                          menuHeight: 200,
                          controller: _topic,
                          enableFilter: true,
                          requestFocusOnTap: true,
                          leadingIcon: const Icon(Icons.search),
                          label: const Text(Const.DICTIONARY_ADD_FORM_TITLE_CHOOSE_TOPIC_TITLE),
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
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: Const.DICTIONARY_ADD_FORM_FIELD_NAME_HINT,
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
                    hintText: Const.DICTIONARY_ADD_FORM_FIELD_TRANSLATE_HINT,
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
                    hintText: Const.DICTIONARY_ADD_FORM_FIELD_EXAMPLE_HINT,
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w100,
                    ),
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _insertTopic() async {
    if(_checkValidationField()){
      Word word = Word(
          name: _name.text,
          translate: _translate.text,
          example: _example.text,
          topic_id: selectedTopic?.id_topic,
          isLearn: 0,
          isRepeatFirst: 0,
          isRepeatSecond: 0,
          isRepeatThird: 0
      );
      Provider.of<WordProvider>(context, listen: false).insertWord(word: word);
      FlashMessage(
          messageShort: Const.DICTIONARY_MESSAGE_SHORT_ADD,
          messageLong:  Const.DICTIONARY_MESSAGE_LONG_ADD,
          colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
      Navigator.pop(context, true);
    } else {
      FlashMessage(
          messageShort: Const.DICTIONARY_MESSAGE_SHORT_DONT_ADD,
          messageLong:  Const.DICTIONARY_MESSAGE_LONG_DONT_ADD,
          colorMessage: Theme.of(context).colorScheme.errorContainer).getScaffoldMessage(context);
    }
  }

  bool _checkValidationField(){
    //Пробіли з обох боків
    _name.text = trim(_name.text);
    _translate.text = trim(_translate.text);
    _example.text = trim(_example.text);
    //Довжина + Не пусте
    if(isLength(_name.text, 1, 40) && isLength(_translate.text, 1, 40) && isLength(_example.text, 1, 60) && selectedTopic != null){
      return true;
    }else{
      return false;
    }
  }
}


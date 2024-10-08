import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../domain/model/topic.dart';
import '../../../../domain/model/word.dart';
import '../../../../router/router.dart';
import '../../../study/presentation/widgets/snap_message/snap_message.dart';
import '../../../topic/presentation/provider/topic_provider.dart';
import 'package:studrow/assets/constants.dart' as Const;

@RoutePage()
class WordDetailsPage extends StatefulWidget {
  final Word word;

  const WordDetailsPage({super.key, required this.word});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}
// Потрібно змінити відображення деталей слова, та відображати як у вивченні слів у вигляді картки
class _WordDetailsPageState extends State<WordDetailsPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _translate = TextEditingController();
  final TextEditingController _example = TextEditingController();
  final TextEditingController _topic = TextEditingController();
  Topic? selectedTopic;
  int? selectedIdTopic;
  String? selectedTopicName;
  String newTopicName = "";
  bool dontEdit = true;
  int? wordInTopicByTopic_Id;
  Word? previusWord;


  @override
  void initState() {
    if (widget.word.topic_id!= null){
      wordInTopicByTopic_Id = widget.word.topic_id!;
      _getDetailsTopic(widget.word.topic_id!);
    }
    if(widget.word != null){
      previusWord = widget.word;
      _name.text = widget.word.name;
      _translate.text = widget.word.translate;
      _example.text = widget.word.example;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopicProvider>(context);
    if (provider.isLoadingTopicInformation){
      return Scaffold(
        appBar: AppBar(
          title: Text(_name.text),
          actions: [
            getIcon(),
            IconButton(
                onPressed: _deleteWord,
                icon: Icon(Icons.delete)
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitWanderingCubes(
                color: Theme.of(context).colorScheme.secondary,
                size: 80,
              ),
              Text(
                Const.SPINKIT_LOADING,
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
      );
    }else{
      selectedTopicName = provider.topic[0].name;
      return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(_name.text),
          actions: [
            getIcon(),
            IconButton(
                onPressed: _deleteWord,
                icon: Icon(Icons.delete)
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
                    getDownMenu(selectedTopicName!),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextField(
                    autofocus: true,
                    readOnly: dontEdit,
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
                    readOnly: dontEdit,
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
                    readOnly: dontEdit,
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

  }
  _editWord(){
    setState(() {
      dontEdit = false;
    });
  }

  _updateWord() async {
    if(_checkValidationField()){
      setState(() {
        dontEdit = true;
        newTopicName = selectedTopic!.name;
      });
      Word word = Word(
          id_word: widget.word.id_word,
          name: _name.text,
          translate: _translate.text,
          example: _example.text,
          topic_id: selectedIdTopic,
          isLearn: 0,
          isRepeatFirst: 0,
          isRepeatSecond: 0,
          isRepeatThird: 0);
      Provider.of<WordProvider>(context, listen: false).updateWord(word: word);
      Provider.of<WordProvider>(context, listen: false).getWords;
      FlashMessage(messageShort: Const.DICTIONARY_MESSAGE_SHORT_UPDATE ,messageLong:  Const.DICTIONARY_MESSAGE_LONG_ADD,colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
      previusWord = word;
    }else{
      setState(() {
        dontEdit = true;
        newTopicName = (previusWord!.topic_name)!;
      });
      FlashMessage(messageShort: Const.DICTIONARY_MESSAGE_SHORT_DONT_UPDATE ,messageLong:  Const.DICTIONARY_MESSAGE_LONG_DONT_UPDATE ,colorMessage: Theme.of(context).colorScheme.errorContainer).getScaffoldMessage(context);
    }
  }

  _deleteWord() async {
    Provider.of<WordProvider>(context, listen: false).deleteWord(id: widget.word.id_word!);
    Navigator.pop(context, true);
    FlashMessage(messageShort: Const.DICTIONARY_MESSAGE_SHORT_DELETE,messageLong:  Const.DICTIONARY_MESSAGE_LONG_DELETE,colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
  }

  Widget getDownMenu(String nameTopic){
    if(nameTopic != newTopicName && !newTopicName!.isEmpty){
      nameTopic = newTopicName;
    }
    if(dontEdit){
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            nameTopic,
            style: TextStyle(
                fontSize: 18
            ),
          )
      );
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Consumer<TopicProvider>(
          builder: (context, provider, child) {
            return provider.topics.isEmpty? const Center(child: Text("Empty")):
            DropdownMenu<Topic>(
              enabled: !dontEdit,
              width: (MediaQuery.of(context).size.width/2 + 50),
              menuHeight: 200,
              controller: _topic,
              enableFilter: true,
              requestFocusOnTap: true,
              leadingIcon: const Icon(Icons.search),
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
      );
    }
  }

  Widget getIcon(){
    if (!dontEdit) {
      return IconButton(
          onPressed: _updateWord,
          icon: Icon(Icons.done)
      );
    } else {
      return IconButton(
          onPressed: _editWord,
          icon: Icon(Icons.edit)
      );
    }
  }

  _getDetailsTopic(int id){
    Provider.of<TopicProvider>(context, listen: false).getTopic(id);
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

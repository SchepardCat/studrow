import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';

import '../../../../domain/model/word.dart';

@RoutePage()
class WordDetailsPage extends StatefulWidget {
  final Word word;

  const WordDetailsPage({super.key, required this.word});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _translate = TextEditingController();
  final TextEditingController _example = TextEditingController();
  bool dontEdit = true;

  @override
  void initState() {
    if(widget.word != null){
      _name.text = widget.word.name;
      _translate.text = widget.word.translate;
      _example.text = widget.word.example;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                autofocus: true,
                readOnly: dontEdit,
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
                readOnly: dontEdit,
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
                readOnly: dontEdit,
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
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                  }, child: const Text('Choose a topic')),
            ),
          ],
        ),
      ),
    );
  }
  _editWord(){
    setState(() {
      dontEdit = false;

    });
  }

  _updateWord() async {
    setState(() {
      dontEdit = true;
    });
    final Word word = Word(
        id_word: widget.word.id_word,
        name: _name.text,
        translate: _translate.text,
        example: _example.text,
        topic_id: widget.word.topic_id,
        isLearn: 0,
        isRepeatFirst: 0,
        isRepeatSecond: 0,
        isRepeatThird: 0);
    Provider.of<WordProvider>(context, listen: false).updateWord(word: word);
    print("Update word complete");
  }

  _deleteWord() async {
    Provider.of<WordProvider>(context, listen: false).deleteWord(id: widget.word.id_word!);
    Navigator.pop(context, true);
    print("Delete word complete");
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
}

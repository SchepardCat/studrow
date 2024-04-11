import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/dictionary/presentation/form/form_add_word.dart';
import 'package:studrow/features/dictionary/presentation/pages/dictionary_word_list.dart';
import 'package:studrow/router/router.dart';


@RoutePage()
class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dictionary"),
        ),
        body: WordsListPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(WordFormAddRoute());
          },
          tooltip: 'Form add new word',
          child: const Icon(Icons.add),
        ),
      );
  }
}

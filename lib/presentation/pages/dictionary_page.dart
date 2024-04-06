import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studrow/presentation/widgets/dictionary_list/dictionary_list.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  bool chosenWord = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(text: "word"),
              Tab(text: "folder"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            //всі слова відсортовані за алфавітом
            DictionaryList(),
            //теки та слова відсортовані в іерархії по текам
            DictionaryList(),
          ],
        ),

        //Buttom add new word or folder
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/formAdd');
          },
          tooltip: 'Form add new word',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studrow/presentation/widgets/dictionary_list/dictionary_list.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
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
            DictionaryList(),
            Icon(Icons.directions_transit),
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

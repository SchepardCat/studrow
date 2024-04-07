import 'package:flutter/material.dart';
import 'package:studrow/presentation/widgets/folder_list/folders_list.dart';
import 'package:studrow/presentation/widgets/word_list/word_list.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
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
              Tab(text: "Lists"),
              Tab(text: "Words"),
            ],
            dividerHeight: 2,
          ),
        ),

        body: const TabBarView(
          children: [
            ListFolders(),
            ListWords(),
          ],
        ),

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

import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/study_page.dart';
import 'package:studrow/presentation/pages/word_details_page.dart';

class DictionaryList extends StatefulWidget {
  const DictionaryList({super.key});

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Text('Entry ${entries[index]}'),
              onTap: (){
                Navigator.pushNamed(context, '/word');
              }

              // color: Theme.of(context).colorScheme.secondary,
              // child: Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Text('Entry ${entries[index]}', style: TextStyle(fontSize: 22.0),),
              // ),
          );
        }
    );
  }
}

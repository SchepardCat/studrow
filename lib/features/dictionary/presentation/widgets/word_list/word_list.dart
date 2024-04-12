import 'package:flutter/material.dart';
import 'package:studrow/features/dictionary/presentation/widgets/word_list/word_item_list.dart';

import '../../../../../domain/model/word.dart';

class ListWords extends StatefulWidget {
  const ListWords({super.key});

  @override
  State<ListWords> createState() => _ListWordsState();
}

class _ListWordsState extends State<ListWords> {
  final List<String> entries = Word().listWord;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return WordItemList(listData: entries, index: index);
      },
    );
  }
}

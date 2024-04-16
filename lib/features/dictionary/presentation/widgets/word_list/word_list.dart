import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/features/dictionary/presentation/widgets/word_list/word_item_list.dart';

import '../../../../../domain/model/word.dart';

class ListWords extends StatefulWidget {
  const ListWords({super.key});

  @override
  State<ListWords> createState() => _ListWordsState();
}

class _ListWordsState extends State<ListWords> {


  @override
  Widget build(BuildContext context) {
    return Consumer<WordProvider>(
      builder: (context, provider, child) {
        return provider.words.isEmpty? const Center(child: Text("Empty")):
        ListView(
            children: provider.words.map((e) => WordItemList(word: e,)).toList());
      },
    );
  }
}

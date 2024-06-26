import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studrow/features/dictionary/presentation/widgets/word_list/word_list.dart';
import 'package:studrow/features/dictionary/presentation/widgets/search/dictionary_search.dart';

@RoutePage()
class WordsListPage extends StatelessWidget {
  const WordsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WordSearch(),
          Expanded(child: ListWords()),
        ],
      ),
    );
  }
}

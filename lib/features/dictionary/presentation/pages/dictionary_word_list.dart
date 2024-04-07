import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/features/dictionary/presentation/widgets/word_list/word_list.dart';


@RoutePage()
class WordsListPage extends StatelessWidget {
  const WordsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListWords(),
      ),
    );
  }
}
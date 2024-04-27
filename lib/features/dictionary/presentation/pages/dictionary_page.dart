import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/dictionary/presentation/pages/dictionary_word_list.dart';
import 'package:studrow/router/router.dart';
import 'package:studrow/assets/constants.dart' as Const;

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
        title: Center(
          child: Text(
            Const.DICTIONARY_APP_BAR_TITLE,
            style: TextStyle(
                fontSize: 26, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      body: WordsListPage(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AutoRouter.of(context).push(WordFormAddRoute());
        },
        tooltip: Const.DICTIONARY_BOTTOM_BUTTON_TOOLTIP,
        icon: const Icon(Icons.add),
        label: Text(Const.DICTIONARY_BOTTOM_BUTTON_TITLE),
      ),
    );
  }
}

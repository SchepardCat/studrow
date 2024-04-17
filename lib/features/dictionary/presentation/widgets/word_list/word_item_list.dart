import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/router/router.dart';

import '../../../../../domain/model/word.dart';
import '../../../../topic/presentation/provider/topic_provider.dart';

class WordItemList extends StatefulWidget {
  final Word word;

  const WordItemList({required this.word});

  @override
  State<WordItemList> createState() => _WordItemListState();
}

class _WordItemListState extends State<WordItemList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.lens, color: Theme.of(context).colorScheme.primaryContainer),
            title: Text(widget.word.id_word.toString() + " - " + widget.word.name),
            onTap: () {
              AutoRouter.of(context).push(WordDetailsRoute(word: widget.word));
            },
            trailing: Icon(Icons.arrow_forward, ),
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }

}

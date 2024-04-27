import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/router/router.dart';
import '../../../../../domain/model/word.dart';

class WordItemList extends StatefulWidget {
  final Word word;

  const WordItemList({required this.word});

  @override
  State<WordItemList> createState() => _WordItemListState();
}

class _WordItemListState extends State<WordItemList> {

  @override
  Widget build(BuildContext context) {
    Color colorTile = Theme.of(context).colorScheme.primaryContainer;
    if(widget.word.isLearn == 1){
      colorTile = Theme.of(context).colorScheme.tertiary;
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.lens, color: colorTile),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.word.name),
                Text(widget.word.translate, style: TextStyle(color: Theme.of(context).colorScheme.outline),),
              ],
            ),
            onTap: () {
              AutoRouter.of(context).push(WordDetailsRoute(word: widget.word));
            },
            trailing: const Icon(Icons.arrow_forward, size: 18,),
          ),
          const Divider(
            height: 0,
          )
        ],
      ),
    );
  }

}

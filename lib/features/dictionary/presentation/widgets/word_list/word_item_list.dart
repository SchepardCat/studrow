import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/router/router.dart';

class WordItemList extends StatefulWidget {
  final List<String> listData;
  final int index;

  const WordItemList({required this.listData, required this.index});

  @override
  State<WordItemList> createState() =>
      new _WordItemListState(listData: listData, index: index);
}

class _WordItemListState extends State<WordItemList> {
  final List<String> listData;
  final int index;

  _WordItemListState({required this.listData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            title: Text('Entry ${listData[index]}'),
            onTap: () {
              AutoRouter.of(context).push(WordDetailsRoute());
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

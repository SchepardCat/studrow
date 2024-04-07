import 'package:flutter/material.dart';

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
              Navigator.pushNamed(context, '/word');
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

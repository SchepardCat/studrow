import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/router/router.dart';


class TopicItemList extends StatefulWidget {
  final List<String> listData;
  final int index;

  const TopicItemList({required this.listData, required this.index});

  @override
  State<TopicItemList> createState() =>
      new _TopicItemListState(listData: listData, index: index);
}

class _TopicItemListState extends State<TopicItemList> {
  final List<String> listData;
  final int index;

  _TopicItemListState({required this.listData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Entry ${listData[index]}'),
            onTap: () {
              AutoRouter.of(context).push(DictionaryRoute());
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

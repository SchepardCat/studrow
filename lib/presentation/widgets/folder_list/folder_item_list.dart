import 'package:flutter/material.dart';
import 'package:studrow/presentation/widgets/word_list/word_item_list.dart';

class FolderItemList extends StatefulWidget {
  final List<String> listData;
  final int index;

  const FolderItemList({required this.listData, required this.index});

  @override
  State<FolderItemList> createState() =>
      new _FolderItemListState(listData: listData, index: index);
}

class _FolderItemListState extends State<FolderItemList> {
  final List<String> listData;
  final int index;

  _FolderItemListState({required this.listData, required this.index});

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
              Navigator.pushNamed(context, '/listWord');
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

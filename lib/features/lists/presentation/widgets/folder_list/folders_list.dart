import 'package:flutter/material.dart';


import 'folder_item_list.dart';


class ListFolders extends StatefulWidget {
  const ListFolders({super.key});

  @override
  State<ListFolders> createState() => _ListFoldersState();
}

class _ListFoldersState extends State<ListFolders> {
  List<String> entries = <String>['D', 'F', 'G'];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return FolderItemList(listData: entries, index: index);
      },
    );
  }
}

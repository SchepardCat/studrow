import 'package:flutter/material.dart';
import 'package:studrow/domain/model/Folder.dart';


import 'folder_item_list.dart';


class ListFolders extends StatefulWidget {
  const ListFolders({super.key});

  @override
  State<ListFolders> createState() => _ListFoldersState();
}

class _ListFoldersState extends State<ListFolders> {
  final List<String> entries = Folder().listFolders;

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

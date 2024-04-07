import 'package:flutter/material.dart';
import '../widgets/folder_list/folders_list.dart';


class FoldersListPage extends StatelessWidget {
  const FoldersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListFolders(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../presentation/widgets/search/search.dart';
import '../widgets/folder_list/folders_list.dart';

class FoldersListPage extends StatelessWidget {
  const FoldersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SearchWidget(),
            Expanded(child: ListFolders()),
          ],
        ),
      ),
    );
  }
}


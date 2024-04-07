import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../widgets/folder_list/folders_list.dart';

@RoutePage()
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

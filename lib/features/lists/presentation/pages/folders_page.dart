import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/lists/presentation/pages/dictionary_folder_list.dart';

import '../form/form_add_list.dart';




@RoutePage()
class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});

  @override
  State<FoldersPage> createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folders"),
      ),
      body: FoldersListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: listFormAdd(),
              );
            },
          );
        },
        tooltip: 'Form add new folder',
        child: const Icon(Icons.add),
      ),
    );
  }
}
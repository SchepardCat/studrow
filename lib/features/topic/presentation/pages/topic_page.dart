import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/topic/presentation/pages/dictionary_topic_list.dart';
import '../form/form_add_list.dart';




@RoutePage()
class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage>{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
      ),
      body: TopicsPageBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: listFormAdd(),
              );
            },
          );
        },
        tooltip: 'Form add new topic',
        icon: const Icon(Icons.add),
        label: Text("New topic"),
      ),
    );
  }
}
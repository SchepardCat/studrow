import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/features/topic/presentation/pages/dictionary_topic_list.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import '../form/form_add_topic.dart';

@RoutePage()
class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopicProvider>(context);
    if (!provider.isLoadingTopicPage) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Topics" , style: TextStyle(fontSize: 22),)),
        ),
        body: TopicsPageBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: TopicFormAdd(),
                );
              },
            );
          },
          tooltip: 'Form add new topic',
          icon: const Icon(Icons.add),
          label: Text("New topic"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Topics"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitWanderingCubes(
                color: Theme.of(context).colorScheme.secondary,
                size: 80,
              ),
              Text(
                'Loading...',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
      );
    }
  }
}

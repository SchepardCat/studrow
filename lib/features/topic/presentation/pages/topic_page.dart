import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/topic/presentation/pages/dictionary_topic_list.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import '../form/form_add_topic.dart';
import 'package:studrow/assets/constants.dart' as Const;

@RoutePage()
class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopicProvider>(context);
    if (!provider.isLoadingTopicPage && !isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            Const.TOPICS_APP_BAR_TITLE,
            style: TextStyle(fontSize: 26,
            color: Theme.of(context).colorScheme.primary),
          )),
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
          tooltip: Const.TOPICS_BOTTOM_BUTTON_TOOLTIP,
          icon: const Icon(Icons.add),
          label: const Text(
              Const.TOPICS_BOTTOM_BUTTON_TITLE
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                Const.TOPICS_APP_BAR_TITLE,
                style: TextStyle(fontSize: 26,
                    color: Theme.of(context).colorScheme.primary),
              )),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitRotatingPlain(
                color: Theme.of(context).colorScheme.secondary,
                size: 80,
              ),
              Text(
                Const.SPINKIT_LOADING,
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

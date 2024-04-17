import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/study/presentation/pages/study_card_page.dart';
import 'package:studrow/router/router.dart';

import '../../../../domain/model/topic.dart';
import '../../../topic/presentation/provider/topic_provider.dart';

@RoutePage()
class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final TextEditingController _topic = TextEditingController();
  Topic? selectedTopic;
  bool dontEdit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopicProvider>(context);
    if (!provider.isLoadingTopicPage) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Study"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: [
                  //Список вибору папки з якої слова будеш вивчати
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text("Choose topic you want study"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Consumer<TopicProvider>(
                        builder: (context, provider, child) {
                          return provider.topics.isEmpty
                              ? const Center(child: Text("Empty"))
                              : DropdownMenu<Topic>(
                                  width:
                                      (MediaQuery.of(context).size.width - 36),
                                  menuHeight: 200,
                                  label: Text("Choose topic"),
                                  controller: _topic,
                                  enableFilter: true,
                                  requestFocusOnTap: true,
                                  leadingIcon: const Icon(Icons.search),
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                  ),
                                  onSelected: (Topic? topic) {
                                    setState(() {
                                      selectedTopic = topic;
                                    });
                                  },
                                  dropdownMenuEntries: provider.topics
                                      .map<DropdownMenuEntry<Topic>>(
                                    (Topic topic) {
                                      return DropdownMenuEntry<Topic>(
                                          value: topic,
                                          label: topic.name,
                                          leadingIcon:
                                              Text(topic.id_topic.toString()));
                                    },
                                  ).toList(),
                                );
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AutoRouter.of(context).push(StudyCardRoute());
                      },
                      child: const Text('Study')),
                  ElevatedButton(
                      onPressed: () {
                        AutoRouter.of(context).push(RepeatRoute());
                      },
                      child: const Text('Repeat')),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Study"),
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
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
      );
    }
  }
}

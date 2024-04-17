import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/type_learn.dart';
import 'package:studrow/features/study/presentation/pages/study_methods_page.dart';
import 'package:studrow/features/study/presentation/widgets/snap_message/snap_message.dart';
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
  bool isLearnRandom = true;
  bool isLearnByTopics = false;
  bool isRepeatOldWord = false;

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
          title: Center(
            child: Text(
              "Study",
              style: TextStyle(
                  fontSize: 26, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Список вибору як проходитиме навчання
                  Container(
                    child: Column(
                      children: [
                        getMethodStudy(),
                        //Список вибору папки з якої слова будеш вивчати
                        getChooseTopic(),
                      ],
                    ),
                  ),
                  //Кнопка навчання
                  SizedBox(
                    width: 150,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: pressButtonLearn,
                        child: const Text(
                          'Learn',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       AutoRouter.of(context).push(RepeatRoute());
                  //     },
                  //     child: const Text('Repeat')),
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

  Widget getMethodStudy() {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "Choose method learn word",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  value: isLearnRandom,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value! == isLearnByTopics &&
                          value! == isRepeatOldWord) {
                        isLearnRandom = value!;
                      } else {
                        isLearnRandom = value!;
                        isLearnByTopics = !value;
                        isRepeatOldWord = !value;
                      }
                    });
                  },
                  title: const Text(
                    'Random word',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                CheckboxListTile(
                  value: isLearnByTopics,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value! == isLearnRandom &&
                          value! == isRepeatOldWord) {
                        isLearnByTopics = value!;
                      } else {
                        isLearnByTopics = value!;
                        isLearnRandom = !value;
                        isRepeatOldWord = !value;
                      }
                    });
                  },
                  title: const Text('Word by topics'),
                ),
                CheckboxListTile(
                  value: isRepeatOldWord,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value! == isLearnByTopics &&
                          value! == isLearnRandom) {
                        isRepeatOldWord = value!;
                      } else {
                        isRepeatOldWord = value!;
                        isLearnByTopics = !value;
                        isLearnRandom = !value;
                      }
                    });
                  },
                  title: const Text('Repeat word'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getChooseTopic() {
    if (isLearnByTopics) {
      return Container(
        child: Column(
          children: [
            const Divider(
              height: 0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Choose topic",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Consumer<TopicProvider>(
                  builder: (context, provider, child) {
                    return provider.topics.isEmpty
                        ? const Center(child: Text("Empty"))
                        : DropdownMenu<Topic>(
                            width: (MediaQuery.of(context).size.width - 36),
                            menuHeight: 200,
                            controller: _topic,
                            enableFilter: true,
                            requestFocusOnTap: true,
                            leadingIcon: const Icon(Icons.search),
                            inputDecorationTheme: const InputDecorationTheme(
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.0),
                            ),
                            onSelected: (Topic? topic) {
                              setState(() {
                                selectedTopic = topic;
                              });
                            },
                            dropdownMenuEntries:
                                provider.topics.map<DropdownMenuEntry<Topic>>(
                              (Topic topic) {
                                return DropdownMenuEntry<Topic>(
                                    value: topic,
                                    label: topic.name,
                                    leadingIcon: Text(
                                      topic.id_topic.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ));
                              },
                            ).toList(),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  pressButtonLearn() {
    if (isLearnRandom) {
      AutoRouter.of(context).push(StudyMethodsRoute(TypeLearn: TypeLearn.random));
    } else if (isLearnByTopics) {
      AutoRouter.of(context).push(StudyMethodsRoute(TypeLearn: TypeLearn.topic));
    } else if (isRepeatOldWord) {
      AutoRouter.of(context).push(RepeatRoute());
    } else {
      //message nothing choose
      //
      //
      //
      FlashMessage(
              messageShort: "Error!",
              messageLong: "Please choose one method learn word",
              colorMessage: Theme.of(context).colorScheme.errorContainer)
          .getScaffoldMessage(context);
    }
  }
}

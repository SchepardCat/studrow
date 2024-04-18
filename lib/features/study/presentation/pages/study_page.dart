import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/type_learn.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
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
  //checkbox
  bool isLearnRandom = true;
  bool isLearnByTopics = false;
  bool isRepeatOldWord = false;
  //
  //logic repeat and study
  String titleButton = "Learn";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopicProvider>(context);
    if (!provider.isLoadingTopicPage)
    {
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
                    child: getButton(titleButton),
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
          title: Center(
            child: Text(
              "Study",
              style: TextStyle(
                  fontSize: 26, color: Theme.of(context).colorScheme.primary),
            ),
          ),
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
                        titleButton = "Learn";
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
                      selectedTopic = null;
                      _topic.clear();
                      if (value! == isLearnRandom &&
                          value! == isRepeatOldWord) {
                        isLearnByTopics = value!;
                      } else {
                        isLearnByTopics = value!;
                        isLearnRandom = !value;
                        isRepeatOldWord = !value;
                        titleButton = "Learn";
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
                        titleButton = "Repeat";
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
                            label: Text("Topic"),
                            requestFocusOnTap: true,
                            leadingIcon: const Icon(Icons.search),
                            inputDecorationTheme: const InputDecorationTheme(
                              filled: false,
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
                                    );
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

  Widget getButton(String name){
    return ElevatedButton(
        onPressed: pressButtonLearn,
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ));
  }

  pressButtonLearn() async {
    if (isLearnRandom) {
      AutoRouter.of(context).push(StudyMethodsRoute(typeLearn: TypeLearn.random));
    } else if (isLearnByTopics) {
      if(selectedTopic != null){
        AutoRouter.of(context).push(StudyMethodsRoute(typeLearn: TypeLearn.topic, topicid: selectedTopic!.id_topic));
      }else{
        FlashMessage(
            messageShort: "Error!",
            messageLong: "Please choose topic",
            colorMessage: Theme.of(context).colorScheme.errorContainer)
            .getScaffoldMessage(context);
      }
      selectedTopic = null;
      _topic.clear();
    } else if (isRepeatOldWord) {
      //logic repeat study
      final providerRepeat = Provider.of<WordProvider>(context, listen: false);
      if(providerRepeat.isLoadingListFirstRepetition != null &&
          providerRepeat.isLoadingListSecondRepetition != null &&
          providerRepeat.isLoadingListThirdRepetition !=null) {
        if(providerRepeat.isLoadingListFirstRepetition! > 40 ||
            providerRepeat.isLoadingListSecondRepetition! > 120 ||
            providerRepeat.isLoadingListThirdRepetition! > 250){
          _logicGetWordsList();
        }else{
          FlashMessage(
              messageShort: "Error!",
              messageLong: "Nothing words for repeat",
              colorMessage: Theme.of(context).colorScheme.primaryContainer)
              .getScaffoldMessage(context);
        }
      }else{
        FlashMessage(
            messageShort: "NULL!",
            messageLong: "Nothing words for repeat",
            colorMessage: Theme.of(context).colorScheme.primaryContainer)
            .getScaffoldMessage(context);
      }
    }else{
      //message nothing choose
      //
      //
      //
      FlashMessage(
              messageShort: "Error!",
              messageLong: "Please choose one method learn word",
              colorMessage: Theme.of(context).colorScheme.primaryContainer)
          .getScaffoldMessage(context);
    }
  }

  _logicGetWordsList() async {
    //logic get list
    final providerRepeat = Provider.of<WordProvider>(context, listen: false);
    if(providerRepeat.isLoadingListFirstRepetition! > 40){
      //>40
      providerRepeat.getRepeatWordsList(1,0,0,0);
      AutoRouter.of(context).push(StudyRepeatWordsRoute());
      //logging
      print(providerRepeat.isLoadingListFirstRepetition);
      return 0;
    }
    if(providerRepeat.isLoadingListSecondRepetition! > 120){
      //>120
      providerRepeat.getRepeatWordsList(1,1,0,0);
      AutoRouter.of(context).push(StudyRepeatWordsRoute());
      //logging
      print(providerRepeat.isLoadingListSecondRepetition);
      return 0;
    }

    if(providerRepeat.isLoadingListThirdRepetition! > 250){
      //>250
      providerRepeat.getRepeatWordsList(1,1,1,0);
      AutoRouter.of(context).push(StudyRepeatWordsRoute());
      //logging
      print(providerRepeat.isLoadingListThirdRepetition);
      return 0;
    }
  }
}

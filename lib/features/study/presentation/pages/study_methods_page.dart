import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/study/presentation/pages/study_by_topic.dart';
import 'package:studrow/features/study/presentation/pages/study_random.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../domain/model/type_learn.dart';
import '../../../dictionary/presentation/provider/dictionary_provider.dart';

@RoutePage()
class StudyMethodsPage extends StatefulWidget {
  final int? topic_id;
  final TypeLearn typeLearn;
  const StudyMethodsPage({super.key, required this.typeLearn, this.topic_id});

  @override
  State<StudyMethodsPage> createState() => _StudyMethodsPageState();
}

class _StudyMethodsPageState extends State<StudyMethodsPage> {

  @override
  Widget build(BuildContext context) {
    if(TypeLearn.random == widget.typeLearn){
      Provider.of<WordProvider>(context, listen: false).getWordsRandomStudy();
      return StudyRandomWord();
    }else if(TypeLearn.topic == widget.typeLearn){
      if(widget.topic_id != null){
        Provider.of<WordProvider>(context, listen: false).getWordsInTopicDontLearn(topic_id: widget.topic_id!);
        return StudyByTopics();
      }else{
        return Container(child: Text("Program error!!!"));
      }
    }else{
      return Container(child: Text("Program error!!!"));
    }
  }
}



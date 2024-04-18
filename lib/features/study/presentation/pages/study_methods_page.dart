import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/study/presentation/pages/study_by_topic.dart';
import 'package:studrow/features/study/presentation/pages/study_random.dart';
import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/study/presentation/provider/study_provider.dart';

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
      final provider = Provider.of<StudyProvider>(context, listen: false);
      //
      //Потрібна для того щоб пофіксити ситуацію, коли слово вивчене, повернено до попереднього меню
      //і знову зайдено то слово залишалось, так як список слів не перезбирався.
      provider.isLoadingListWordForRandom = true;
      //
      provider.getWordsRandomStudy();
      return StudyRandomWord();
    }else if(TypeLearn.topic == widget.typeLearn){
      if(widget.topic_id != null){
        //delete
        final provider = Provider.of<StudyProvider>(context, listen: false);
        //Вирішення проблеми аналогічно з рандом сторінкою
        provider.isLoadingListWordByTopic = true;
        //
        provider.getWordsInTopicDontLearn(topic_id: widget.topic_id!);
        return StudyByTopics();
      }else{
        return Container(child: Text("Program error!!!"));
      }
    }else{
      return Container(child: Text("Program error!!!"));
    }
  }
}



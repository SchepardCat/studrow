import 'package:flutter/material.dart';
import 'package:studrow/features/study/presentation/pages/study_by_topic.dart';
import 'package:studrow/features/study/presentation/pages/study_random.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StudyMethodsPage extends StatelessWidget {
  final TypeLearn;
  const StudyMethodsPage({super.key, required this.TypeLearn});

  @override
  Widget build(BuildContext context) {
    if(TypeLearn == TypeLearn.random){
       return StudyRandomWord();
    }else if(TypeLearn == TypeLearn.topic){
      return StudyByTopics();
    }else{
      return Container(child: Text("Program error!!!"));
    }
  }
}



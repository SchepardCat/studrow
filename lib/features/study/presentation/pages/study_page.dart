import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/features/study/presentation/pages/study_card_page.dart';
import 'package:studrow/router/router.dart';


@RoutePage()
class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
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
  }
}

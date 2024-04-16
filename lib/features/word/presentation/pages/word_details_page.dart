import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../domain/model/word.dart';

@RoutePage()
class WordDetailsPage extends StatefulWidget {
  final Word word;

  const WordDetailsPage({super.key, required this.word});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word"),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "View details word",
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              Icon(
                Icons.assistant_photo,
                size: 48,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}

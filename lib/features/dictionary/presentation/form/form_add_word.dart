import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WordFormAddPage extends StatelessWidget {
  const WordFormAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Add new word"),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Form add new word",
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

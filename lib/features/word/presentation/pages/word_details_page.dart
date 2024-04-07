import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key});

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

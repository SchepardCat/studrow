import 'package:flutter/material.dart';

class WordDetails extends StatefulWidget {
  const WordDetails({super.key});

  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        toolbarHeight: 75,
      ),
      body: const Center(
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
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WordFormAddPage extends StatefulWidget {
  const WordFormAddPage({super.key});

  @override
  State<WordFormAddPage> createState() => _WordFormAddPageState();
}

class _WordFormAddPageState extends State<WordFormAddPage> {
  final TextEditingController _controllerFilled = TextEditingController();
  final TextEditingController _controllerFilled2 = TextEditingController();
  final TextEditingController _controllerFilled3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new word"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 32,
              icon: const Icon(Icons.done),
              onPressed: () {
                /*
                    Написати метод долавання в БД





                     */
                Navigator.pop(context, true);
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _controllerFilled,
                decoration: InputDecoration(
                  hintText: 'new word',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _controllerFilled2,
                decoration: InputDecoration(
                  hintText: 'translation',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                maxLines: 4,
                controller: _controllerFilled3,
                decoration: InputDecoration(
                  hintText: 'example',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w100,
                  ),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                  }, child: const Text('Choose a topic')),
            ),
          ],
        ),
      ),
    );
  }
}


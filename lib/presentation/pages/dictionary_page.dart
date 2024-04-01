import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/formAdd');
        },
        tooltip: 'Add new word',
        child: const Icon(Icons.add),
      ),
    );
  }
}

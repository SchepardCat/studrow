import 'package:flutter/material.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
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
            Text("Form add new word",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black
              ),
            ),
            Icon(Icons.assistant_photo,size: 48, color: Colors.black,)
          ],
        ),
      ),
    );
  }
}

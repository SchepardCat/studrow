import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import '../../presentation/widgets/progress_bar/progress_bar.dart';
import '../dictionary/presentation/provider/dictionary_provider.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Learny words",
            style: TextStyle(
                fontSize: 26, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hi, welcome back  ",
                      style: TextStyle(
                        fontSize: 24,
                      ),),
                      Icon(Icons.waving_hand),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Learn words", style: TextStyle(fontSize: 16),),
                        ProgressBar(
                            totalCards: 5, currentNumber: 1, widthBar: 120)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All words", style: TextStyle(fontSize: 16),),
                        ProgressBar(
                            totalCards: 1500,
                            currentNumber: 543,
                            widthBar: 120),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Must repeat word", style: TextStyle(fontSize: 16),),
                        ProgressBar(
                            totalCards: 543, currentNumber: 403, widthBar: 120),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: pressButtonLearn,
                        child: const Text(
                          'Add test data',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void pressButtonLearn() async {
    Provider.of<WordProvider>(context, listen: false).insertTestWords(20);
    print("Add all test data");
  }
}

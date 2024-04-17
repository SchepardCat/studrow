import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../presentation/widgets/progress_bar/progress_bar.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Вивчено слів сьогодні"),
                        ProgressBar(
                            totalCards: 5, currentNumber: 1, widthBar: 120)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Загальна кількість слів"),
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
                        Text("Потрібно повторити слів"),
                        ProgressBar(
                            totalCards: 543, currentNumber: 403, widthBar: 120),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

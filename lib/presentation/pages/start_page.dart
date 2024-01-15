import 'package:flutter/material.dart';
import 'package:studrow/presentation/widgets/progress_bar/progress_bar.dart';
import 'package:studrow/standart_setting.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            StSetting.companyName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          toolbarHeight: 75,
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/setting');
              },
              icon: Icon(Icons.settings),
            )
          ]
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
                    Row(
                      children: [
                        Text(
                            "Привіт, " + StSetting.nameUser,
                          style: TextStyle(
                            fontSize: 26
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Вивчено слів сьогодні"),
                        ProgressBar(totalCards: 5, currentNumber: 1, widthBar: 120)
                      ],),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Загальна кількість слів"),
                        ProgressBar(totalCards: 1500, currentNumber: 543, widthBar: 120),
                      ],),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("Потрібно повторити слів"),
                        ProgressBar(totalCards: 543, currentNumber: 403, widthBar: 120),
                    ],),
                  ],
                ),
                FilledButton.tonal(
                    onPressed: (){
                      Navigator.pushNamed(context, '/main');
                    },
                    child: Text(
                      "Почати",
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

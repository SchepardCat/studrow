import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/study_page.dart';
import 'package:studrow/standart_setting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    const StudyPage(),
    const Center(child: Text("Repeat", style: TextStyle(fontSize: 72))),
    const Center(child: Text("Dictionary", style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Hi, ${StSetting.nameUser}",
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
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
        ),
        child: NavigationBar(
          height: 75,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index ),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.book),
                label: "Study"),
            NavigationDestination(
                icon: Icon(Icons.repeat),
                label: "Repeat"),
            NavigationDestination(
                icon: Icon(Icons.chrome_reader_mode),
                label: "Dictionary"),
          ],
        ),
      ),
    );
  }
}

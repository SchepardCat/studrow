import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/dictionary_page.dart';
import 'package:studrow/presentation/pages/study_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    const DictionaryPage(),
    const StudyPage(),
    const Center(child: Text("Exam", style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          toolbarHeight: 75,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
        ),
        child: NavigationBar(
          height: 75,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index ),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.chrome_reader_mode),
                label: "Dictionary"),
            NavigationDestination(
                icon: Icon(Icons.book),
                label: "Study"),
            NavigationDestination(
                icon: Icon(Icons.repeat),
                label: "Repeat"),
          ],
        ),
      ),
    );
  }
}

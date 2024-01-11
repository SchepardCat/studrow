import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/dictionary.dart';
import 'package:studrow/presentation/pages/study.dart';
import 'package:studrow/presentation/pages/study.dart';
import 'package:studrow/standart_setting.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _standartSetting = StSetting("Vladislav", 5);
  int index = 0;
  final screens = [
    // const Center(child: Text("Study", style: TextStyle(fontSize: 72))),
    StudyPage(),
    const Center(child: Text("Repeat", style: TextStyle(fontSize: 72))),
    const Center(child: Text("Dictionary", style: TextStyle(fontSize: 72))),
    const Center(child: Text("Settings", style: TextStyle(fontSize: 72))),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text("Hi, ${_standartSetting.nameUser}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),),
          toolbarHeight: 75,
          backgroundColor:Colors.black,
        ),
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
          child: NavigationBar(
            height: 75,
            backgroundColor: Colors.black,
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
              NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}


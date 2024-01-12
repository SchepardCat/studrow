import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/study_page.dart';
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
  int index = 0;
  final screens = [
    const StudyPage(),
    const Center(child: Text("Repeat", style: TextStyle(fontSize: 72))),
    const Center(child: Text("Dictionary", style: TextStyle(fontSize: 72))),
    const Center(child: Text("Setting", style: TextStyle(fontSize: 72))),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/finish': (context) => const FinishLearnPage(),
      // },
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text("Hi, ${StSetting.nameUser}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
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


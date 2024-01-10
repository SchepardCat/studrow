import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    Center(child: Text("Study", style: TextStyle(fontSize: 72))),
    Center(child: Text("Repeat", style: TextStyle(fontSize: 72))),
    Center(child: Text("Dictionary", style: TextStyle(fontSize: 72))),
    Center(child: Text("Settings", style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi, Vladislav",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),),
          toolbarHeight: 75,
          backgroundColor: Color.fromRGBO(0, 129, 167, 100),
        ),
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Color.fromRGBO(254, 217, 183, 100),
          ),
          child: NavigationBar(
            height: 75,
            backgroundColor: Color.fromRGBO(0, 129, 167, 100),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index ),
            destinations: [
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

pressSetting() {
  print("Button Setting");
}

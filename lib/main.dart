import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/main_page.dart';
import 'package:studrow/presentation/pages/settings_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/setting': (context) => const SettingsPage(),
        '/main': (contex) => const MainPage()
      },
      home: MainPage()
    );
  }
}


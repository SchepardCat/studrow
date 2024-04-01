import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/form_add.dart';
import 'package:studrow/presentation/pages/main_page.dart';
import 'package:studrow/presentation/pages/settings_page.dart';
import 'package:studrow/presentation/pages/logo_page.dart';
import 'package:studrow/presentation/pages/start_page.dart';
import 'package:studrow/presentation/theme/theme.dart';
import 'presentation/theme/typography.dart';

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
      theme: MaterialTheme(textTheme).light(),
      routes: {
        '/setting': (context) => const SettingsPage(),
        '/main': (contex) => const MainPage(),
        '/start': (contex) => const StartPage(),
        '/formAdd': (contex) => const FormAdd(),
      },
      home: const LogoPage()
    );
  }
}


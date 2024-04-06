import 'package:flutter/material.dart';
import 'package:studrow/presentation/pages/form_add.dart';
import 'package:studrow/presentation/pages/main_page.dart';
import 'package:studrow/presentation/pages/settings_page.dart';
import 'package:studrow/presentation/pages/logo_page.dart';
import 'package:studrow/presentation/pages/account_page.dart';
import 'package:studrow/presentation/pages/study_page.dart';
import 'package:studrow/presentation/pages/word_details_page.dart';
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
          '/logo': (context) => const LogoPage(),
          '/setting': (context) => const SettingsPage(),
          '/main': (contex) => const MainPage(),
          '/start': (contex) => const StartPage(),
          '/formAdd': (contex) => const FormAdd(),
          '/word' : (context) => const WordDetails(),
        },
        home: const LogoPage());
  }
}


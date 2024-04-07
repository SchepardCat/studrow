import 'package:flutter/material.dart';
import 'package:studrow/presentation/form/form_add.dart';
import 'package:studrow/presentation/pages/main_page.dart';
import 'package:studrow/presentation/pages/settings_page.dart';
import 'package:studrow/presentation/pages/logo_page.dart';
import 'package:studrow/presentation/pages/account_page.dart';
import 'package:studrow/presentation/pages/study_page.dart';
import 'package:studrow/presentation/pages/word_details_page.dart';
import 'package:studrow/presentation/theme/theme.dart';
import 'package:studrow/presentation/widgets/word_list/word_list.dart';
import 'package:studrow/router/router.dart';
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
  final _router = AppRouter();


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: MaterialTheme(textTheme).light(),
        routerConfig: _router.config(),
    );
  }
}


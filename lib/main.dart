import 'package:flutter/material.dart';
import 'package:studrow/router/router.dart';
import 'ui/theme/theme.dart';
import 'ui/theme/typography.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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


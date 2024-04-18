import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/word.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:studrow/router/router.dart';
import 'features/study/presentation/provider/study_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TopicProvider()),
        ChangeNotifierProvider(create: (_) => WordProvider()),
        ChangeNotifierProvider(create: (_) => StudyProvider()),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MaterialTheme(textTheme).light(),
          routerConfig: _router.config(),
      ),
    );
  }
}


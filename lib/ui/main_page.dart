import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:studrow/router/router.dart';

import '../features/dictionary/presentation/provider/dictionary_provider.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    TopicProvider();
    WordProvider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        AccountRoute(),
        StudyRoute(),
        TopicsRoute(),
        DictionaryRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBarTheme(
            data: const NavigationBarThemeData(),
            child: NavigationBar(
              //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              height: 90,
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (index) => _openPage(index, tabsRouter),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.book), label: "Study"),
                NavigationDestination(icon: Icon(Icons.folder), label: "Topics"),
                NavigationDestination(icon: Icon(Icons.chrome_reader_mode), label: "Dictionary"),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}

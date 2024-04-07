import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:studrow/router/router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        AccountRoute(),
        StudyRoute(),
        RepeatRoute(),
        DictionaryRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBarTheme(
            data: const NavigationBarThemeData(),
            child: NavigationBar(
              height: 75,
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (index) => _openPage(index, tabsRouter),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.account_circle), label: "Account"),
                NavigationDestination(icon: Icon(Icons.book), label: "Study"),
                NavigationDestination(icon: Icon(Icons.repeat), label: "Repeat"),
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

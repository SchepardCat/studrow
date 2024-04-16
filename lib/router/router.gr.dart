// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    DictionaryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DictionaryPage(),
      );
    },
    DictionaryWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DictionaryWrapperScreen()),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    RepeatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RepeatPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    StudyCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudyCardPage(),
      );
    },
    StudyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudyPage(),
      );
    },
    StudyWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const StudyWrapperScreen()),
      );
    },
    TopicDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TopicDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TopicDetailsPage(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    TopicWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TopicWrapperScreen()),
      );
    },
    TopicsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TopicsPage(),
      );
    },
    WordDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WordDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WordDetailsPage(
          key: args.key,
          word: args.word,
        ),
      );
    },
    WordFormAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WordFormAddPage(),
      );
    },
    WordsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WordsListPage(),
      );
    },
  };
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DictionaryPage]
class DictionaryRoute extends PageRouteInfo<void> {
  const DictionaryRoute({List<PageRouteInfo>? children})
      : super(
          DictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DictionaryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DictionaryWrapperScreen]
class DictionaryWrapperRoute extends PageRouteInfo<void> {
  const DictionaryWrapperRoute({List<PageRouteInfo>? children})
      : super(
          DictionaryWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'DictionaryWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RepeatPage]
class RepeatRoute extends PageRouteInfo<void> {
  const RepeatRoute({List<PageRouteInfo>? children})
      : super(
          RepeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'RepeatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudyCardPage]
class StudyCardRoute extends PageRouteInfo<void> {
  const StudyCardRoute({List<PageRouteInfo>? children})
      : super(
          StudyCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudyCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudyPage]
class StudyRoute extends PageRouteInfo<void> {
  const StudyRoute({List<PageRouteInfo>? children})
      : super(
          StudyRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudyWrapperScreen]
class StudyWrapperRoute extends PageRouteInfo<void> {
  const StudyWrapperRoute({List<PageRouteInfo>? children})
      : super(
          StudyWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudyWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TopicDetailsPage]
class TopicDetailsRoute extends PageRouteInfo<TopicDetailsRouteArgs> {
  TopicDetailsRoute({
    Key? key,
    required Topic topic,
    List<PageRouteInfo>? children,
  }) : super(
          TopicDetailsRoute.name,
          args: TopicDetailsRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicDetailsRoute';

  static const PageInfo<TopicDetailsRouteArgs> page =
      PageInfo<TopicDetailsRouteArgs>(name);
}

class TopicDetailsRouteArgs {
  const TopicDetailsRouteArgs({
    this.key,
    required this.topic,
  });

  final Key? key;

  final Topic topic;

  @override
  String toString() {
    return 'TopicDetailsRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [TopicWrapperScreen]
class TopicWrapperRoute extends PageRouteInfo<void> {
  const TopicWrapperRoute({List<PageRouteInfo>? children})
      : super(
          TopicWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TopicsPage]
class TopicsRoute extends PageRouteInfo<void> {
  const TopicsRoute({List<PageRouteInfo>? children})
      : super(
          TopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WordDetailsPage]
class WordDetailsRoute extends PageRouteInfo<WordDetailsRouteArgs> {
  WordDetailsRoute({
    Key? key,
    required Word word,
    List<PageRouteInfo>? children,
  }) : super(
          WordDetailsRoute.name,
          args: WordDetailsRouteArgs(
            key: key,
            word: word,
          ),
          initialChildren: children,
        );

  static const String name = 'WordDetailsRoute';

  static const PageInfo<WordDetailsRouteArgs> page =
      PageInfo<WordDetailsRouteArgs>(name);
}

class WordDetailsRouteArgs {
  const WordDetailsRouteArgs({
    this.key,
    required this.word,
  });

  final Key? key;

  final Word word;

  @override
  String toString() {
    return 'WordDetailsRouteArgs{key: $key, word: $word}';
  }
}

/// generated route for
/// [WordFormAddPage]
class WordFormAddRoute extends PageRouteInfo<void> {
  const WordFormAddRoute({List<PageRouteInfo>? children})
      : super(
          WordFormAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordFormAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WordsListPage]
class WordsListRoute extends PageRouteInfo<void> {
  const WordsListRoute({List<PageRouteInfo>? children})
      : super(
          WordsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

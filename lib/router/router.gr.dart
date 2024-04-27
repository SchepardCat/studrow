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
    StudyMethodsRoute.name: (routeData) {
      final args = routeData.argsAs<StudyMethodsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudyMethodsPage(
          key: args.key,
          typeLearn: args.typeLearn,
          topic_id: args.topicid,
        ),
      );
    },
    StudyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudyPage(),
      );
    },
    StudyRepeatWordsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudyRepeatWordsPage(),
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
/// [StudyMethodsPage]
class StudyMethodsRoute extends PageRouteInfo<StudyMethodsRouteArgs> {
  StudyMethodsRoute({
    Key? key,
    required TypeLearn typeLearn,
    int? topicid,
    List<PageRouteInfo>? children,
  }) : super(
          StudyMethodsRoute.name,
          args: StudyMethodsRouteArgs(
            key: key,
            typeLearn: typeLearn,
            topicid: topicid,
          ),
          initialChildren: children,
        );

  static const String name = 'StudyMethodsRoute';

  static const PageInfo<StudyMethodsRouteArgs> page =
      PageInfo<StudyMethodsRouteArgs>(name);
}

class StudyMethodsRouteArgs {
  const StudyMethodsRouteArgs({
    this.key,
    required this.typeLearn,
    this.topicid,
  });

  final Key? key;

  final TypeLearn typeLearn;

  final int? topicid;

  @override
  String toString() {
    return 'StudyMethodsRouteArgs{key: $key, typeLearn: $typeLearn, topicid: $topicid}';
  }
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
/// [StudyRepeatWordsPage]
class StudyRepeatWordsRoute extends PageRouteInfo<void> {
  const StudyRepeatWordsRoute({List<PageRouteInfo>? children})
      : super(
          StudyRepeatWordsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudyRepeatWordsRoute';

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

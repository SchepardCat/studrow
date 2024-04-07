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
    FoldersListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoldersListPage(),
      );
    },
    FoldersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoldersPage(),
      );
    },
    ListWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ListWrapperScreen()),
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
    StudyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudyPage(),
      );
    },
    WordDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WordDetailsPage(),
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
/// [FoldersListPage]
class FoldersListRoute extends PageRouteInfo<void> {
  const FoldersListRoute({List<PageRouteInfo>? children})
      : super(
          FoldersListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoldersPage]
class FoldersRoute extends PageRouteInfo<void> {
  const FoldersRoute({List<PageRouteInfo>? children})
      : super(
          FoldersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListWrapperScreen]
class ListWrapperRoute extends PageRouteInfo<void> {
  const ListWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ListWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListWrapperRoute';

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
/// [WordDetailsPage]
class WordDetailsRoute extends PageRouteInfo<void> {
  const WordDetailsRoute({List<PageRouteInfo>? children})
      : super(
          WordDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordDetailsRoute';

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

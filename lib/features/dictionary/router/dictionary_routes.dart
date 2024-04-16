import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/dictionary/router/dictionary_route_wrapper_screen.dart';
import 'package:studrow/router/router.dart';

abstract class DictionaryRoutes {
  static final routes = AutoRoute(
    page: DictionaryWrapperRoute.page,
    children: [
      AutoRoute(page: DictionaryRoute.page, initial: true),
      AutoRoute(page: WordFormAddRoute.page),
      AutoRoute(page: WordDetailsRoute.page),
      AutoRoute(page: TopicListRoute.page),
    ],
  );
}
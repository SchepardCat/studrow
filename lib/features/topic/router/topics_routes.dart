import 'package:auto_route/auto_route.dart';
import 'package:studrow/router/router.dart';

abstract class TopicRoutes {
  static final routes = AutoRoute(
    page: TopicWrapperRoute.page,
    children: [
      AutoRoute(page: TopicsRoute.page, initial: true),
      AutoRoute(page: TopicDetailsRoute.page),
      AutoRoute(page: WordDetailsRoute.page),
    ],
  );
}
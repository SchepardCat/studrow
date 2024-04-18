import 'package:auto_route/auto_route.dart';
import 'package:studrow/router/router.dart';

abstract class StudyRoutes {
  static final routes = AutoRoute(
    page: StudyWrapperRoute.page,
    children: [
      AutoRoute(page: StudyRoute.page, initial: true),
      AutoRoute(page: StudyMethodsRoute.page),
      AutoRoute(page: StudyRepeatWordsRoute.page),
    ],
  );
}
import 'package:auto_route/auto_route.dart';
import 'package:studrow/router/router.dart';

abstract class ListRoutes {
  static final routes = AutoRoute(
    page: ListWrapperRoute.page,
    children: [
      AutoRoute(page: FoldersRoute.page, initial: true),
      AutoRoute(page: WordDetailsRoute.page),
      AutoRoute(page: DictionaryRoute.page),
      AutoRoute(page: WordFormAddRoute.page),
    ],
  );
}
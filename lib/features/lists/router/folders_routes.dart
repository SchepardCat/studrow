import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/lists/router/folder_route_wrapper_screen.dart';
import 'package:studrow/router/router.dart';

abstract class ListRoutes {
  static final routes = AutoRoute(
    page: ListWrapperRoute.page,
    children: [
      AutoRoute(page: FoldersRoute.page, initial: true),
      AutoRoute(page: WordsListRoute.page),
    ],
  );
}
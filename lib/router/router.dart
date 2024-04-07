import 'package:auto_route/auto_route.dart';
import 'package:studrow/features/lists/router/folders_routes.dart';

import '../features/account/account_page.dart';
import '../features/dictionary/presentation/pages/dictionary_page.dart';
import '../features/dictionary/presentation/pages/dictionary_word_list.dart';
import '../features/word/presentation/pages/word_details_page.dart';
import '../features/dictionary/router/dictionary_route_wrapper_screen.dart';
import '../features/dictionary/router/dictionary_routes.dart';
import '../features/lists/presentation/pages/folders_page.dart';
import '../features/lists/router/folder_route_wrapper_screen.dart';
import '../features/repeat/exam_page.dart';

import '../ui/main_page.dart';
import '../features/settings/settings_page.dart';
import '../features/study/presentation/pages/study_page.dart';



part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: MainRoute.page,
        initial: true,
        children: [
          AutoRoute(
              page: AccountRoute.page,
              path: 'account'
          ),
          AutoRoute(
              page: StudyRoute.page,
              path: 'study'
          ),
          AutoRoute(
              page: RepeatRoute.page,
              path: 'repeat'
          ),
          ListRoutes.routes,
          DictionaryRoutes.routes,
          AutoRoute(
              page: SettingsRoute.page,
              path: 'settings'
          ),
        ]),

  ];
}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}
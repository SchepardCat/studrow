import 'package:auto_route/auto_route.dart';

import '../presentation/pages/account_page.dart';
import '../presentation/pages/dictionary_page.dart';
import '../presentation/pages/exam_page.dart';
import '../presentation/pages/main_page.dart';
import '../presentation/pages/settings_page.dart';
import '../presentation/pages/study_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: "/",
        children: [
      AutoRoute(page: AccountRoute.page, path: 'account'),
      AutoRoute(page: StudyRoute.page, path: 'study'),
      AutoRoute(page: RepeatRoute.page, path: 'repeat'),
      AutoRoute(page: DictionaryRoute.page, path: 'dictionary'),
      AutoRoute(page: SettingsRoute.page, path: 'settings'),
    ]),
  ];
}
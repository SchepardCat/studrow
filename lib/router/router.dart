import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/domain/model/topic.dart';

import '../features/account/account_page.dart';
import '../features/dictionary/presentation/form/form_add_word.dart';
import '../features/dictionary/presentation/pages/dictionary_page.dart';
import '../features/dictionary/presentation/pages/dictionary_word_list.dart';
import '../features/dictionary/router/dictionary_route_wrapper_screen.dart';
import '../features/dictionary/router/dictionary_routes.dart';
import '../features/repeat/exam_page.dart';
import '../features/settings/settings_page.dart';
import '../features/study/presentation/pages/study_card_page.dart';
import '../features/study/presentation/pages/study_page.dart';
import '../features/study/router/study_route_wrapper_screen.dart';
import '../features/study/router/study_routes.dart';
import '../features/topic/presentation/pages/topic_details_page.dart';
import '../features/topic/presentation/pages/topic_page.dart';
import '../features/topic/router/topic_route_wrapper_screen.dart';
import '../features/topic/router/topics_routes.dart';
import '../features/word/presentation/pages/word_details_page.dart';
import '../ui/main_page.dart';
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
          StudyRoutes.routes,
          TopicRoutes.routes,
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
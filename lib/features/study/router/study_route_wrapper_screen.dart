import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../router/router.dart';

@RoutePage()
class StudyWrapperScreen extends StatelessWidget implements AutoRouteWrapper {
  const StudyWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyRouterPage();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
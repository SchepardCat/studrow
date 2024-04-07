import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import '../../../router/router.dart';


@RoutePage()
class DictionaryWrapperScreen extends StatelessWidget implements AutoRouteWrapper {
  const DictionaryWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyRouterPage();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
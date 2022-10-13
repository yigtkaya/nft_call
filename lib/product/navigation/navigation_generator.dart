import 'package:flutter/material.dart';

import '../../view/exceptions/not_found_page.dart';

@Deprecated("by fkin GETX")
class NavigationGenerator {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    //StatelessWidget? view = MenuFactory.instance?.getView(settings.name ?? "");
    StatelessWidget? view;

    if (view != null) {
      return _navigateBuilder(settings.arguments, view);
    } else {
      return _navigateBuilder(settings.arguments, const NotFoundPage());
    }
  }

  static MaterialPageRoute _navigateBuilder(Object? args, Widget page) {
    return MaterialPageRoute(builder: (context) => page, settings: RouteSettings(arguments: args));
  }
}

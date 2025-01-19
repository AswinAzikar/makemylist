import 'package:flutter/material.dart';
import 'package:makemylist/views/completedView/completed_view.dart';

import 'package:makemylist/views/main_view/main_view.dart';

class AppRoutes {
  static const String main = "/";
  static const String completedView = 'Completed';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (context) => MainView());

      case completedView:
        return MaterialPageRoute(
          builder: (context) => CompletedView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text("there is no page for this "),
          ),
        );
    }
  }
}

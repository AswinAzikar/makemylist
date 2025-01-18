import 'package:flutter/material.dart';
import 'package:makemylist/views/home_view.dart';

class AppRoutes {
  static const String home = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text("there is no page for this "),
          ),
        );
    }
  }
}

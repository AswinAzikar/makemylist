import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text("home will be here"),
          ),
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

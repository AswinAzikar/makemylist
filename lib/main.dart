import 'package:flutter/material.dart';
import 'package:makemylist/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Center(
            child: Text("to be Implmented"),
          ),
          backgroundColor: Colors.amberAccent,
        ));
  }
}

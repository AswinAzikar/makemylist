import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/routes/app_routes.dart';
import 'package:makemylist/utils/size_utils.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodosEvent()),
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.home,
        builder: (context, child) => Sizer(
          builder: (context, orientation, deviceType) => child ?? SizedBox(),
        ),
      ),
    );
  }
}

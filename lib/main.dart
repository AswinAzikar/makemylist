import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/home_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ),
        ),
      ],
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}

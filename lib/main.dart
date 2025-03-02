import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_cubit/task_cubit.dart';
import 'package:task_manager_cubit/task_manager_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TaskManagerPage(),
        ),
    );
  }
}
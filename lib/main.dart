// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/views/screens/task_screen.dart';
import 'blocs/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(
          CreateTask(
            task: Task(title: 'FirsTask'),
          ),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigoAccent,
          ),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}

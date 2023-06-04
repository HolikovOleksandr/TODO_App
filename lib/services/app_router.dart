import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/recycle_bin.dart';
import 'package:todo_app/views/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      default:
        return null;
    }
  }
}

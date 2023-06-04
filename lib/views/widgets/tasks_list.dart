import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/views/widgets/task_tile.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return TaskTileWidget(task: task);
        },
      ),
    );
  }
}

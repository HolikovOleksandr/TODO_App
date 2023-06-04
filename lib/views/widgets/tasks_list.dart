import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/models/task.dart';

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
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
            trailing: IconButton(
              color: Colors.green.shade400,
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<TasksBloc>().add(DeleteTask(task: task));
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import '../../blocs/bloc_exports.dart';

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({super.key, required this.task});

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
      ),
      trailing: IconButton(
        color: Colors.green.shade400,
        icon: const Icon(Icons.delete),
        onPressed: () => _removeOrDeleteTask(context, task),
      ),
    );
  }
}

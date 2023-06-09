import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});
  static const id = 'pending_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var tasks = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chip(label: Text('${tasks.length} Tasks')),
            TasksListWidget(tasks: tasks),
          ],
        );
      },
    );
  }
}

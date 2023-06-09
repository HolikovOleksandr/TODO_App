import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});
  static const id = 'completed_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var tasks = state.completedTasks;
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

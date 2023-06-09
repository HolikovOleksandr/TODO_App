import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static const id = 'favorite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var tasks = state.favoriteTasks;
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

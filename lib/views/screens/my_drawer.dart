import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/screens/recycle_bin.dart';
import 'package:todo_app/views/screens/tasks_screen.dart';

import '../../blocs/bloc/tasks_state.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Bin'),
                trailing: Text('0'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

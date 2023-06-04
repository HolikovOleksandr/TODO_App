import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/screens/my_drawer.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            centerTitle: true,
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                label: Text(
                  '${state.binTasks.length} Tasks',
                ),
              ),
              TasksListWidget(tasks: state.binTasks),
            ],
          ),
        );
      },
    );
  }
}

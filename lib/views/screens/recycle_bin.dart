import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/widgets/my_drawer.dart';
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
          drawer: const MyDrawerWidget(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                label: Text(
                  '${state.removedTasks.length} Tasks',
                ),
              ),
              TasksListWidget(tasks: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}

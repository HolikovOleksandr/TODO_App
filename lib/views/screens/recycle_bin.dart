import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/my_drawer.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chip(
            label: Text('Tasks'),
            labelStyle: TextStyle(fontSize: 18),
          ),
          TasksListWidget(tasks: []),
        ],
      ),
    );
  }
}

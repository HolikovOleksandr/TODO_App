import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc/tasks_state.dart';
import 'package:todo_app/views/widgets/create_task.dart';
import 'package:todo_app/views/widgets/tasks_list.dart';
import '../../blocs/bloc_exports.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var titleContrler = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateTaskWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var tasks = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('My ToDo List'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Chip(
                label: Text('Tasks'),
                labelStyle: TextStyle(fontSize: 18),
              ),
              TasksListWidget(tasks: tasks),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Create new task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/models/task.dart';

class CreateTaskWidget extends StatelessWidget {
  const CreateTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var titleContrler = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add new task'),
          const SizedBox(height: 10),
          TextFormField(
            autofocus: true,
            controller: titleContrler,
            validator: (titleContrler) =>
                titleContrler!.isEmpty ? 'Empty field' : null, // ???
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  var task = Task(title: titleContrler.text);
                  context.read<TasksBloc>().add(CreateTask(task: task));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Create'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              )
            ],
          )
        ],
      ),
    );
  }
}

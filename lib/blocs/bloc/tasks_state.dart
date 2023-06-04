import 'package:equatable/equatable.dart';
import 'package:todo_app/models/task.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> binTasks;
  const TasksState({
    this.allTasks = const <Task>[],
    this.binTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, binTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'binTasks': binTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      binTasks: List<Task>.from(map['binTasks']?.map((x) => Task.fromMap(x))),
    );
  }

  // String toJson() => json.encode(toMap());
}

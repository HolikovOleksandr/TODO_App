import 'package:equatable/equatable.dart';
import 'package:todo_app/blocs/bloc/tasks_state.dart';
import 'package:todo_app/models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<CreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  _onCreateTask(CreateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(TasksState(
      allTasks: List.of(state.allTasks)..add(event.task),
    ));
  }

  _onUpdateTask(UpdateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emitter(TasksState(allTasks: allTasks));
  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(TasksState(
      allTasks: List.of(state.allTasks)..remove(event.task),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}

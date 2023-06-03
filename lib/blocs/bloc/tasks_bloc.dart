import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
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

  _onUpdateTask(UpdateTask even, Emitter<TasksState> emitter) {

  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(TasksState(
      allTasks: List.of(state.allTasks)..remove(event.task),
    ));
  }
}

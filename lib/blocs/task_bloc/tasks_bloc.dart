import 'package:equatable/equatable.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/models/task.dart';
part 'tasks_event.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<CreateTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  _onAddTask(CreateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  _onUpdateTask(UpdateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    final task = event.task;
    var pendingTasks = state.pendingTasks;
    var completedTasks = state.pendingTasks;

    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emitter(
      TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  _onRemoveTask(RemoveTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emitter(
      TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
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

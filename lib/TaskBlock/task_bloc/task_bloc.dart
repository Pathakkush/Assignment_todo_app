import 'package:equatable/equatable.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteAndUnfavoriteTask>(_onMarkFavoriteAndUnfavoriteTask);
    // on<EditTask>(_onEditTask);
    // on<RestoreTask>(_onRestoreTask);
    // on<DeleteTaskPermanently>(_onDeleteTaskPermanently);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pedingTasks: List.from(state.pedingTasks)..add(event.task),
      comepletedTasks: state.comepletedTasks,
      favoriteTasks: state.favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pedingTasks;
    List<Task> completedTasks = state.comepletedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(state.pedingTasks)..remove(task),
            completedTasks = List.from(state.comepletedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(state.comepletedTasks)..remove(task),
            pendingTasks = List.from(state.pedingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(TaskState(
      pedingTasks: pendingTasks,
      comepletedTasks: completedTasks,
      favoriteTasks: state.favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        pedingTasks: state.pedingTasks,
        comepletedTasks: state.comepletedTasks,
        favoriteTasks: state.favoriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pedingTasks: List.from(state.pedingTasks)..remove(event.task),
      comepletedTasks: List.from(state.comepletedTasks)..remove(event.task),
      favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
      removeTasks: List.from(state.removeTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onMarkFavoriteAndUnfavoriteTask(
      MarkFavoriteAndUnfavoriteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> pedingTasks = state.pedingTasks;
    List<Task> comepletedTasks = state.comepletedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pedingTasks.indexOf(event.task);
        pedingTasks = List.from(state.pedingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pedingTasks.indexOf(event.task);
        pedingTasks = List.from(state.pedingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = comepletedTasks.indexOf(event.task);
        comepletedTasks = List.from(state.comepletedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = comepletedTasks.indexOf(event.task);
        comepletedTasks = List.from(state.comepletedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }
    emit(TaskState(
      pedingTasks: pedingTasks,
      comepletedTasks: comepletedTasks,
      favoriteTasks: favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pedingTasks;
  final List<Task> comepletedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removeTasks;
  const TaskState({
    this.pedingTasks = const <Task>[],
    this.comepletedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removeTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pedingTasks, removeTasks, comepletedTasks, favoriteTasks];

  Map<String, dynamic> toMap() {
    return {
      'pedingTasks': pedingTasks.map((x) => x.toMap()).toList(),
      'comepletedTasks': comepletedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removeTasks': removeTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pedingTasks:
          List<Task>.from(map['pedingTasks']?.map((x) => Task.fromMap(x))),
      comepletedTasks:
          List<Task>.from(map['comepletedTasks']?.map((x) => Task.fromMap(x))),
      favoriteTasks:
          List<Task>.from(map['favoriteTasks']?.map((x) => Task.fromMap(x))),
      removeTasks:
          List<Task>.from(map['removeTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}

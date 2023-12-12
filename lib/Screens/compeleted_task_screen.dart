import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';

import 'package:todo_app/TaskBlock/bloc_export.dart';
import 'package:todo_app/Widgets/task_list.dart';

// ignore: must_be_immutable
class CompletedTaskScreen extends StatelessWidget {
  static const id = 'task_screen';
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.comepletedTasks;
        return Column(
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${taskList.length} Tasks',
                ),
              ),
            ),
            TaskList(
              taskList: taskList,
            )
          ],
        );
      },
    );
  }
}

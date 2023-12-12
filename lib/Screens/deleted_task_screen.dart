import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';

import 'package:todo_app/Screens/my_drawer_screen.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';

class DeletedTask extends StatelessWidget {
  const DeletedTask({super.key});
  static const id = 'deleted_task';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.removeTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Deleted Tasks',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${taskList.length}' ' Tasks',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

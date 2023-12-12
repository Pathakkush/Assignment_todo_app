import 'package:flutter/material.dart';

import 'package:todo_app/Screens/my_drawer_screen.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';
import 'package:todo_app/Widgets/task_list.dart';

class DeletedTask extends StatelessWidget {
  const DeletedTask({super.key});
  static const id = 'deleted_task';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
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
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            drawer: MyDrawer(),
            body: Column(
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${state.removeTasks.length}' ' Tasks',
                    ),
                  ),
                ),
                TaskList(
                  taskList: state.removeTasks,
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

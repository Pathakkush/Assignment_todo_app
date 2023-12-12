import 'package:flutter/material.dart';
import 'package:todo_app/Screens/deleted_task_screen.dart';
import 'package:todo_app/Screens/tab_screen.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  static const id = 'my_drawer';

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: const Text(
              'Task Drawer',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, TabScreen.id);
                },
                child: ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('My Task'),
                  trailing: Text(
                    '${state.pedingTasks.length} | ${state.comepletedTasks.length}',
                  ),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, DeletedTask.id);
                  print("object");
                },
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Deleted Task'),
                  trailing: Text(
                    '${state.removeTasks.length}',
                  ),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.isDark,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          ),
        ],
      )),
    );
  }
}

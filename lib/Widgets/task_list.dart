import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/Widgets/task_tile.dart';

// ignore: must_be_immutable
class TaskList extends StatelessWidget {
  TaskList({
    super.key,
    required this.taskList,
  });

  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) {
                      return TaskTile(task: task);
                    },
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Text\n",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: task.tital,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const TextSpan(
                              text: "\n\nDescription\n",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: task.description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
// Expanded(
//       child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (context, index) {
//             var task = taskList[index];
//             return TaskTile(task: task);
//           }),
//     );
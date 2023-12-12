import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  const EditTaskScreen({
    super.key,
    required this.task,
  });

  static const id = 'add_task_screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController titalController =
        TextEditingController(text: task.tital);
    TextEditingController discriptionController =
        TextEditingController(text: task.description);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Edit Task',
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titalController,
            decoration: const InputDecoration(
              labelText: 'Tital',
              hintText: 'Enter Tital',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: discriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Discription',
              hintText: 'Enter Discription',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: () {}, child: const Text('Save'))
            ],
          ),
        ],
      ),
    );
  }
}

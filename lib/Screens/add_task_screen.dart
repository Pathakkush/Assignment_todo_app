import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';
import 'package:todo_app/services/guid_genrate.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  static const id = 'add_task_screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController titalController = TextEditingController();
    TextEditingController discriptionController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
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
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      tital: titalController.text,
                      description: discriptionController.text,
                      id: GUIDGenrate.generate(),
                      date: DateTime.now().toString(),
                    );
                    context.read<TaskBloc>().add(AddTask(
                          task: task,
                        ));
                    Navigator.pop(context);
                    titalController.text = '';
                  },
                  child: const Text('Add'))
            ],
          ),
        ],
      ),
    );
  }
}

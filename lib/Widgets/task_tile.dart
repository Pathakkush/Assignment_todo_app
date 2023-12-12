import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';
import 'package:todo_app/Widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeAndDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: task.isFavorite == false
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.tital,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                      )),
                  Text(
                    DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TaskBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
          PopupMenu(
              task: task,
              markFavoriteAndUnfavoriteCallback: () => context
                  .read<TaskBloc>()
                  .add(MarkFavoriteAndUnfavoriteTask(task: task)),
              cancleOrDeleteCallback: () {
                _removeAndDelete(context, task);
              }),
        ],
      ),
    ]);
  }
}

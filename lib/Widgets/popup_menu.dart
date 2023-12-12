import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancleOrDeleteCallback;
  final VoidCallback markFavoriteAndUnfavoriteCallback;

  const PopupMenu({
    super.key,
    required this.task,
    required this.cancleOrDeleteCallback,
    required this.markFavoriteAndUnfavoriteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit")),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    onTap: markFavoriteAndUnfavoriteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text("Add to Bookmark")
                            : const Text("Remove from Bookmark")),
                  ),
                  PopupMenuItem(
                    onTap: cancleOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text("Delete")),
                  ),
                ]
            : (context) => [
                  PopupMenuItem(
                    onTap: () {},
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text("Restore")),
                  ),
                  PopupMenuItem(
                    onTap: cancleOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text("Delete Forever")),
                  ),
                ]);
  }
}

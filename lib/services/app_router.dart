import 'package:flutter/material.dart';
import 'package:todo_app/Screens/deleted_task_screen.dart';
import 'package:todo_app/Screens/tab_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DeletedTask.id:
        return MaterialPageRoute(builder: (_) => const DeletedTask());
      case TabScreen.id:
        return MaterialPageRoute(builder: (_) => TabScreen());
      default:
        return null;
    }
  }
}

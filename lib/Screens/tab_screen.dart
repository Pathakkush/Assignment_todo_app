import 'package:flutter/material.dart';
import 'package:todo_app/Screens/add_task_screen.dart';
import 'package:todo_app/Screens/compeleted_task_screen.dart';
import 'package:todo_app/Screens/favorite_task_screen.dart';
import 'package:todo_app/Screens/my_drawer_screen.dart';
import 'package:todo_app/Screens/pending_screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = const [
    {
      'page': PendingTaskScreen(),
      'title': 'Pending Tasks',
    },
    {
      'page': CompletedTaskScreen(),
      'title': 'Completed Tasks',
    },
    {
      'page': FavoriteTaskScreen(),
      'title': 'Favorite Tasks',
    }
  ];

  var _selectedPage = 0;

  void _onAddTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const AddTaskScreen(),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
        actions: [
          IconButton(
            onPressed: () {
              _onAddTask(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedPage]['page'],
      floatingActionButton: _selectedPage == 0
          ? FloatingActionButton(
              onPressed: () {
                _onAddTask(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle),
            label: "Pending",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}

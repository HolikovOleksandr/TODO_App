import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/completed_screen.dart';
import 'package:todo_app/views/screens/favorite_screen.dart';
import 'package:todo_app/views/screens/pending_screen.dart';
import 'package:todo_app/views/widgets/create_task.dart';
import 'package:todo_app/views/widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingScreen(), 'title': 'Pending'},
    {'pageName': const CompletedScreen(), 'title': 'Completed'},
    {'pageName': const FavoriteScreen(), 'title': 'Favorite'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateTaskWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const MyDrawerWidget(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Create new task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pending"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
    );
  }
}

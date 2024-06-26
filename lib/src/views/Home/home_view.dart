import 'package:flutter/material.dart';
import 'package:task_track/src/services/api_service.dart';
import 'package:task_track/src/widget/ButtonGrid/button_grid.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';
import 'package:task_track/src/widget/RectangleText/rectangle_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _numberOfTasks = 0;
  // List<Task> _tasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTasks('A fazer');
  }

  Future<void> _fetchTasks(String status) async {
    try {
      final tasks = await fetchTasksByStatus(status);
      setState(() {
        // _tasks = tasks;
        _numberOfTasks = tasks.length;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [            
            Image.asset(              
              'lib/assets/images/perfil.png', scale: 4.5, alignment: Alignment.centerRight,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Minhas Tarefas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$_numberOfTasks tarefas hoje',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tarefas recentes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const ButtonGrid(),
            const SizedBox(height: 0),
            // _isLoading
            //     ? const Center(child: CircularProgressIndicator())
            //     : Expanded(
            //         child: ListView.builder(
            //           itemCount: _tasks.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(_tasks[index].description),
            //               leading: const Icon(Icons.task),
            //               subtitle: Text(_tasks[index].status),
            //             );
            //           },
            //         ),
            //       ),
            const SizedBox(height: 0),
            const Expanded(
              child: ChecklistArea(),
            ),
            buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

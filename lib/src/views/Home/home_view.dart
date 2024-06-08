import 'package:flutter/material.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';
import 'package:task_track/src/widget/ButtonGrid/button_grid.dart';
import 'package:task_track/src/widget/RectangleText/rectangle_text.dart';

const AVATAR_IMAGE = 'https://s2-g1.glbimg.com/q1ZgqfWQGKQyxtRoMoRK03gMVfk=/0x0:959x540/600x0/smart/filters:gifv():strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2021/h/J/Ui4XL0So6yEilj6DeGXg/memedoge.jpg';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _numberOfTasks = 0; 

  @override
  void initState() {
    super.initState();
    
    _numberOfTasks = 10; 
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
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(AVATAR_IMAGE),
            ),
            const SizedBox(width: 10),
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
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), 
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
            const Expanded(
              child: ChecklistArea(),
            ),
            const SizedBox(height: 0),
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

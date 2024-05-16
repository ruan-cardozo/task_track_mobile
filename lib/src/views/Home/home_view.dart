import 'package:flutter/material.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';
import 'package:task_track/src/widget/ButtonGrid/button_grid.dart';
import 'package:task_track/src/widget/RectangleText/rectangle_text.dart';

const AVATAR_IMAGE =
    'https://s2-g1.glbimg.com/q1ZgqfWQGKQyxtRoMoRK03gMVfk=/0x0:959x540/600x0/smart/filters:gifv():strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2021/h/J/Ui4XL0So6yEilj6DeGXg/memedoge.jpg';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _numberOfTasks = 0; // Adicionando o número de tarefas

  @override
  void initState() {
    super.initState();
    // Aqui você pode chamar uma função para carregar o número de tarefas do backend
    // Exemplo: _loadNumberOfTasks();
    _numberOfTasks = 10; // Supondo que 10 seja o número inicial de tarefas
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
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(AVATAR_IMAGE),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minhas Tarefas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
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
        padding: EdgeInsets.symmetric(
            horizontal: 10.0), // Ajuste o preenchimento horizontal do AppBar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            ButtonGrid(),
            SizedBox(height: 0),
            Expanded(
              child: ChecklistArea(),
            ),
            SizedBox(height: 0),
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

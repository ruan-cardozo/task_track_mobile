import 'package:flutter/material.dart';
import 'package:task_track/src/views/Home/home_view.dart';
import 'package:task_track/src/views/Profile/profile_view.dart';
import 'package:task_track/src/views/Tasks/task_page_view.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';


class MyDefinitionPage extends StatefulWidget {
  const MyDefinitionPage({Key? key}) : super(key: key);

  @override
  _MyDefinitionPage createState() => _MyDefinitionPage();
}

class _MyDefinitionPage extends State<MyDefinitionPage> {
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }

      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksPage(status: 'Em progresso'),
          ),
        );
      }

      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProfileView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas definições'),
        backgroundColor: const Color.fromRGBO(67, 54, 51, 1),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

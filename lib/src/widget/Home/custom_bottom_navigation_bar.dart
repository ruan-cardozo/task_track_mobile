import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            height: 94,
            left: 0,
            right: 0,
            bottom: -10,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Iniciar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded),
                  label: 'Atividade',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Definições',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Color.fromRGBO(67, 54, 51, 100),
              unselectedItemColor: Color.fromRGBO(143, 143, 143, 100),
              onTap: onItemTapped,
              iconSize: 30.0,
              selectedLabelStyle: TextStyle(fontSize: 14),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 30,
            bottom: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Color.fromRGBO(67, 54, 51, 100),
                fixedSize: const Size(60, 60),
                shape: CircleBorder(),
              ),
              onPressed: () {
                // aqui vai a ação do botão para abrir a tela de tarefas quando for desenvolvida
              },
              child: const Center(
                  child: Icon(
                Icons.add,
                size: 46,
                color: Color.fromRGBO(222, 203, 183, 100),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

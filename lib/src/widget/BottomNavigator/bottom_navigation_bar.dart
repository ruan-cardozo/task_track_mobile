import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment
          .bottomCenter, // Alinhar widgets filhos na parte inferior central
      children: [
        Positioned(
          height: 94,
          left: 0,
          right: 0,
          bottom: -10,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _navBarItems,
            currentIndex: selectedIndex,
            selectedItemColor: const Color.fromRGBO(67, 54, 51, 100),
            unselectedItemColor: const Color.fromRGBO(143, 143, 143, 100),
            onTap: onItemTapped,
            iconSize: 30.0,
            selectedLabelStyle: const TextStyle(fontSize: 14),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: const Color.fromRGBO(67, 54, 51, 100),
                fixedSize: const Size(60, 60),
                shape: const CircleBorder(),
              ),
              onPressed: () {
                // ação do botão para abrir a tela de tarefas
              },
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 46,
                  color: Color.fromRGBO(222, 203, 183, 100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> get _navBarItems => const [
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
      ];
}

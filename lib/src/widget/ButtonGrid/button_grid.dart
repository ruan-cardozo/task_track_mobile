import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';
import 'package:task_track/src/widget/SquareButton/square_button.dart';

class ButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SquareButton(
                    color: Colors.white,
                    title: 'Em progresso',
                    width: 186,
                    height: 169,
                    titleStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    titleColor: Colors.black,
                    icon: Icons.list_alt,
                    onPressed: () {
                      print('Button 1 pressed');
                    },
                  ),
                ),
                Expanded(
                  child: SquareButton(
                    color: Colors.white,
                    title: 'A fazer',
                    titleStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    width: 186,
                    height: 169,
                    titleColor: Colors.black,
                    icon: Icons.poll,
                    onPressed: () {
                      print('Button 2 pressed');
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SquareButton(
                    width: 186,
                    height: 169,
                    icon: Icons.calendar_month,
                    color: Colors.white,
                    titleColor: Colors.black,
                    title: 'Novas tarefas',
                    titleStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    onPressed: () {
                      print('Button 3 pressed');
                    },
                  ),
                ),
                Expanded(
                  child: SquareButton(
                    icon: Icons.checklist,
                    width: 186,
                    height: 169,
                    titleColor: Colors.black,
                    color: Colors.white,
                    title: 'Concluídas',
                    titleStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    onPressed: () {
                      print('Button 4 pressed');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

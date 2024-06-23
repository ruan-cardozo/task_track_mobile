import 'package:flutter/material.dart';
import 'package:task_track/src/views/Tasks/task_page_view.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        _buildButton(context, 'Em progresso', Icons.assignment),
        _buildButton(context, 'A fazer', Icons.check_circle_outline),
        _buildButton(context, 'Novas tarefas', Icons.calendar_today),
        _buildButton(context, 'Concluídas', Icons.done),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String status, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksPage(status: status),
          ),
        );
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 40),
              Text(status),
            ],
          ),
        ),
      ),
    );
  }
}

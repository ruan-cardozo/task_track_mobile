import 'package:flutter/material.dart';

class Task {
  bool isChecked;
  String title;

  Task({required this.title, this.isChecked = false});
}

class TaskWidget extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?>? onChanged;

  const TaskWidget({required this.task, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: task.isChecked,
          onChanged: onChanged,
        ),
        Expanded(
          child: Text(task.title),
        ),
      ],
    );
  }
}

class ChecklistArea extends StatefulWidget {
  @override
  _ChecklistAreaState createState() => _ChecklistAreaState();
}

class _ChecklistAreaState extends State<ChecklistArea> {
  List<Task> tasks = [
    Task(title: 'Tarefa 1'),
    Task(title: 'Tarefa 2'),
    Task(title: 'Tarefa 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Importantes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: tasks[index],
                  onChanged: (bool? value) {
                    setState(() {
                      tasks[index].isChecked = value!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

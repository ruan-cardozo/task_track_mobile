import 'package:flutter/material.dart';

class TaskList {
  bool isChecked;
  String title;

  TaskList({required this.title, this.isChecked = false});
}

class TaskWidget extends StatelessWidget {
  final TaskList task;
  final ValueChanged<bool?>? onChanged;

  const TaskWidget({
    super.key, 
    required this.task, 
    this.onChanged});

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
  const ChecklistArea({super.key});

  @override
  _ChecklistAreaState createState() => _ChecklistAreaState();
}

class _ChecklistAreaState extends State<ChecklistArea> {
  List<TaskList> taskLists = [
    TaskList(title: 'Tarefa 1'),
    TaskList(title: 'Tarefa 2'),
    TaskList(title: 'Tarefa 3'),
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
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
              itemCount: taskLists.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: taskLists[index],
                  onChanged: (bool? value) {
                    setState(() {
                      taskLists[index].isChecked = value!;
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

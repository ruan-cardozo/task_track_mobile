import 'package:flutter/material.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/models/task.dart';
import 'package:task_track/src/services/task_service.dart';
import 'package:task_track/src/views/Tasks/task_view.dart';

class TasksPage extends StatelessWidget {
  final String status;  
  final TaskService taskService = TaskService(baseUrl: BASE_URL, tasks: []);

  TasksPage({required this.status});

  Future<List<Task>> fetchTasksByStatus(status) async {
    return taskService.getTasks(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas - $status'),
      ),
      body: FutureBuilder<List<Task>>(
        future: fetchTasksByStatus(status),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma tarefa encontrada'));
          } else {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].title),
                  leading: const Icon(Icons.task),
                  subtitle: Text(tasks[index].status),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskView(task: tasks[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

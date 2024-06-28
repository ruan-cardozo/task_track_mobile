import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/models/task.dart';
import 'package:task_track/src/services/task_service.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key, required this.task});
  final Task task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  String dropdownValue = 'A fazer';
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;
  TaskService taskService = TaskService(baseUrl: BASE_URL, tasks: []);

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    dateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(widget.task.dueDate.toUtc()));
    descriptionController = TextEditingController(text: widget.task.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizando tarefa'),
        backgroundColor: const Color.fromRGBO(67, 54, 51, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(67, 54, 51, 1),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Título:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(67, 54, 51, 1),
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Título da tarefa',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(67, 54, 51, 1),
              ),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                hintText: '29/12/2003',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Status:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(67, 54, 51, 1),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.expand_more),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Color.fromRGBO(67, 54, 51, 1)),
              underline: Container(
                height: 2,
                color: const Color.fromRGBO(67, 54, 51, 1),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['A fazer', 'Em andamento', 'Concluído']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nota:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(67, 54, 51, 1),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Escreva alguns detalhes da tarefa aqui...',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(67, 54, 51, 1))),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(67, 54, 51, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  DateFormat inputFormat = DateFormat('dd/MM/yyyy');
                  DateTime dateTime = inputFormat.parse(dateController.text);
                  String dateIsoString = dateTime.toIso8601String();
                  final response = await taskService.editTask(
                    titleController.text,
                    dateIsoString,
                    dropdownValue,
                    descriptionController.text,
                    widget.task.id,
                  );

                  if ([200, 201].contains(response.statusCode) && response.body.isNotEmpty) {
                    Fluttertoast.showToast(
                        msg: "Tarefa editada com sucesso!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Houve um erro ao editar a tarefa. Erro: ${response.statusCode}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

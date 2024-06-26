import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/services/task_service.dart';

class TarefaView extends StatefulWidget {
  const TarefaView({super.key});

  @override
  State<TarefaView> createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> {
  String dropdownValue = 'A fazer';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  TaskService taskService = TaskService(baseUrl: BASE_URL, tasks: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        backgroundColor: const Color.fromRGBO(67, 54, 51, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nova tarefa',
              style: TextStyle(
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
                hintText: 'Digite o título da tarefa',
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
                    borderSide:
                        BorderSide(color: Color.fromRGBO(67, 54, 51, 1))),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromRGBO(67, 54, 51, 1), // Background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  DateFormat inputFormat = DateFormat('dd/MM/yyyy');
                  DateTime dateTime = inputFormat.parse(dateController.text);
                  String dateIsoString = dateTime.toIso8601String();
                  final response = await taskService.createTask(
                    titleController.text,
                    dateIsoString,
                    dropdownValue,
                    descriptionController.text,
                  );

                  if ([200, 201].contains(response.statusCode) &&
                      response.body.isNotEmpty) {
                    Fluttertoast.showToast(
                        msg: "Tarefa cadastrada com sucesso!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "Houve um erro ao cadastrar a tarefa. Erro: ${response.statusCode}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                  // Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Iniciar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
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
        selectedItemColor: const Color.fromRGBO(67, 54, 51, 1),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TarefaView(),
  ));
}

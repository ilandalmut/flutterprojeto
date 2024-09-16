import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provides/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Nova Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Título da Tarefa'),
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context); // Volta para a tela anterior
                }
              },
              child: const Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}

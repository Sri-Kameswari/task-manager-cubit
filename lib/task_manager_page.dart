import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_cubit.dart'; // Import TaskCubit

class TaskManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager App")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _showAddTaskDialog(context),
            child: Text("Add Task"),
          ),
          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.tasks[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blueGrey),
                            onPressed: () => _showUpdateTaskDialog(context, index, state.tasks[index]),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => context.read<TaskCubit>().deleteTask(index),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Show input dialog to enter a task
  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Task"),
          content: TextField(controller: taskController),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String task = taskController.text.trim();
                if (task.isNotEmpty) {
                  context.read<TaskCubit>().addTask(task);
                }
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateTaskDialog(BuildContext context, int index, String currentTask) {
    TextEditingController taskController = TextEditingController(text: currentTask);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Task"),
          content: TextField(controller: taskController),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String task = taskController.text.trim();
                if (task.isNotEmpty) {
                  context.read<TaskCubit>().updateTask(index, task);
                }
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

}

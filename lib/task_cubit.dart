import 'package:flutter_bloc/flutter_bloc.dart';

// class TaskState{
//   final List<String> tasks;
//   TaskState({required this.tasks});
// }

class TaskCubit extends Cubit<List<String>>{
  TaskCubit() : super([]);

  void addTask(String task){
    final updatedTasks = List<String>.from(state)..add(task);
    emit(updatedTasks);
  }

  void deleteTask(int index){
    final updatedTasks = List<String>.from(state)..removeAt(index);
    emit(updatedTasks);
  }

  void updateTask(int index, String task){
    final updatedTasks = List<String>.from(state);
    updatedTasks[index] = task;
    emit(updatedTasks);
  }
}
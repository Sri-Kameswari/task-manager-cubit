import 'package:flutter_bloc/flutter_bloc.dart';

class TaskState{
  final List<String> tasks;
  TaskState({required this.tasks});
}

class TaskCubit extends Cubit<TaskState>{
  TaskCubit() : super(TaskState(tasks: []));

  void addTask(String task){
    final updatedTasks = List<String>.from(state.tasks)..add(task);
    emit(TaskState(tasks: updatedTasks));
  }

  void deleteTask(int index){
    final updatedTasks = List<String>.from(state.tasks)..removeAt(index);
    emit(TaskState(tasks: updatedTasks));
  }
}
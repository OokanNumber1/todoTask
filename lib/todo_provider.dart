import 'package:flutter/material.dart';
import 'customs.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [Todo('Jogging', '50 minutes of jogging')];

  void addTask(Todo task) {
    todos.add(task);
    notifyListeners();
  }

  void deleteTask(Todo task) {
    todos.remove(task);
    notifyListeners();
  }

  void editTask(Todo task, Todo newTask) {
    //int index = todos.indexOf(task);
    //todos[index].description = descriptn;
    //todos.elementAt(index);

    //todos.elementAt(index) = task;
    task.title = newTask.title;
    task.description = newTask.description;
    notifyListeners();
  }
}

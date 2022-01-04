import 'package:flutter/material.dart';
import 'customs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoProvider extends ChangeNotifier {
  //List<Todo> todos = [Todo('Jogging', '50 minutes of jogging', '')];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference taskCollections =
      FirebaseFirestore.instance.collection('tasks');

  Stream<QuerySnapshot> todoStream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  Future<void> addTask(Todo task) async {
// Call the user's CollectionReference to add a new user
    return await taskCollections.add({
      'Task Title': task.title,
      'Task Description': task.description,
    }).then(
      (value) {
        print("Task Created with value => $value");
        task.uid = value.id;
      },
    ).catchError(
      (error) => print("Failed to create task: $error"),
    );
    //notifyListeners();
  }

  deleteTask(String uid) async {
    return await taskCollections
        .doc(uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError(
          (error) => print("Failed to delete user: $error"),
        );

    //notifyListeners();
  }

  void editTask(Todo task, Todo newTask) {
    //int index = todos.indexOf(task);
    //todos[index].description = descriptn;
    //todos.elementAt(index);

    //todos.elementAt(index) = task;
    // task.title = newTask.title;
    //taskCollections.doc()
    // task.description = newTask.description;
    taskCollections.doc(task.uid).update(
      {'Task Title': newTask.title, 'Task Description': newTask.description},
    );
    notifyListeners();
  }
}

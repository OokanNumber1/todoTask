import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';

class Todo {
  Todo({required this.title, required this.description, required this.uid});
  String title;
  String description;
  String uid;
}

class TodoCard extends StatelessWidget {
  TodoCard({
    required this.task,
    this.deleteTask,
    this.editTask,
  });

  final Todo task;
  final deleteTask;
  final editTask;

  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context, listen: false);
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.grey[900],
      title: Text(task.title, style: mediumStyle),
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      subtitle: Text(task.description, style: descriptionStyle),
      trailing: Container(
        height: 50,
        width: 50,
        child: Row(
          children: [
            GestureDetector(
                onTap: () => editTask(),
                child: Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: mediumSize,
                )),
            GestureDetector(
                onTap: () => provider.deleteTask(task.uid),
                child: Icon(
                  Icons.delete,
                  color: red,
                  size: mediumSize,
                ))
          ],
        ),
      ),
    );
  }
}

double smallSize = 8;
double mediumSize = 16;
double largeSize = 24;

String newTaskAppBar = 'Add New Task';
String taskTitleText = 'Task Title';
String taskDescription = 'Task Description';
String addText = 'ADD to TASK';
String updateText = 'UPDATE TASK';

Color red = Colors.red;
Color white = Colors.white;

SizedBox smallSpace = SizedBox(height: 8);
SizedBox mediumSpace = SizedBox(height: 16);

SizedBox largeSpace = SizedBox(height: 24);
SizedBox XlargeSpace = SizedBox(height: 44);

TextStyle smallStyle =
    TextStyle(fontSize: 8, color: white, fontWeight: FontWeight.w200);
TextStyle descriptionStyle =
    TextStyle(fontSize: 12, color: white, fontWeight: FontWeight.w400);
TextStyle mediumStyle =
    TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500);
TextStyle largeStyle =
    TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.w800);

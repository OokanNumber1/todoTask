import 'package:flutter/material.dart';
import 'customs.dart';

import 'edit_task.dart';
import 'new_task.dart';
import 'todo_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'List of To-dos',
            style: largeStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.black87),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: provider.todos.length,
          itemBuilder: (context, index) => TodoCard(
              taskTitle: provider.todos[index].title,
              taskDecription: provider.todos[index].description,
              editTask: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) =>
                        EditTask(toEditTask: provider.todos[index]),
                  ),
                );
                //provider.editTask(provider.todos[index]);
                print('object editing');
              },
              deleteTask: () {
                provider.deleteTask(provider.todos[index]);
                print('object deleted');
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => AddTask()));
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
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
          child: StreamBuilder<QuerySnapshot>(
            stream: provider.todoStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
/*
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  //print(document.id);
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return TodoCard(
                    task: Todo(data['Task Title'], data['Task Description'],
                        document.id),
                  );
                }).toList(),
              );
*/

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => TodoCard(
                    task: Todo(
                        title: snapshot.data!.docs[index]['Task Title'],
                        description: snapshot.data!.docs[index]
                            ['Task Description'],
                        uid: snapshot.data!.docs[index].id)),
              );
            },
          )

          // ListView.builder(
          //   itemCount: provider.todos.length,
          //   itemBuilder: (context, index) => TodoCard(
          //       taskTitle: provider.todos[index].title,
          //       taskDecription: provider.todos[index].description,
          //       editTask: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (builder) =>
          //                 EditTask(toEditTask: provider.todos[index]),
          //           ),
          //         );
          //         //provider.editTask(provider.todos[index]);
          //         print(' editing object');
          //       },
          //       deleteTask: () {
          //         provider.deleteTask(provider.todos[index]);
          //         print('object deleted');
          //       }),
          // ),
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

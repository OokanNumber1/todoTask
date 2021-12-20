import 'package:flutter/material.dart';
import 'customs.dart';
import 'todo_provider.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context, listen: false);
    TextEditingController taskTitleController = TextEditingController();
    TextEditingController taskDescriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          newTaskAppBar,
          style: largeStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(largeSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskTitleText,
                style: largeStyle,
              ),
              smallSpace,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(mediumSize)),
                child: TextField(
                  maxLines: 1,
                  controller: taskTitleController,
                  decoration: InputDecoration(
                      hintText: taskTitleText,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: mediumStyle),
                ),
              ),
              largeSpace,
              Text(
                taskDescription,
                style: largeStyle,
              ),
              smallSpace,
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(mediumSize)),
                child: TextField(
                  maxLines: 4,
                  controller: taskDescriptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: taskDescription,
                      hintStyle: mediumStyle),
                ),
              ),
              largeSpace,
              ElevatedButton(
                onPressed: () {
                  provider.addTask(Todo(taskTitleController.text,
                      taskDescriptionController.text));

                  //print(todos);
                },
                child: Text(
                  addText,
                  style: largeStyle,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  minimumSize: Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mediumSize)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

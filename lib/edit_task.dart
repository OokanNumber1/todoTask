import 'package:flutter/material.dart';
import 'customs.dart';
import 'todo_provider.dart';
import 'package:provider/provider.dart';

class EditTask extends StatelessWidget {
  const EditTask({required this.toEditTask});

  final Todo toEditTask;
  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context, listen: true);
    TextEditingController taskTitleController = TextEditingController();
    //taskTitleController.text = toEditTask.title;
    TextEditingController taskDescriptionController = TextEditingController();
    //taskDescriptionController.text = toEditTask.description;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          updateText,
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
                  // controller : toEditTask.title,
                  decoration: InputDecoration(
                      //labelText: toEditTask.title,
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
                      //labelText: toEditTask.description,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: taskDescription,
                      hintStyle: mediumStyle),
                ),
              ),
              largeSpace,
              ElevatedButton(
                onPressed: () {
                  provider.editTask(
                      Todo(toEditTask.title, toEditTask.description),
                      Todo(taskTitleController.text,
                          taskDescriptionController.text));
                },
                child: Text(
                  updateText,
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

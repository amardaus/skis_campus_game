import 'package:flutter/material.dart';
import 'package:skis_campus_game/category.dart';
import 'package:skis_campus_game/task.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class TaskScreen extends StatefulWidget{
  final Category category;

  TaskScreen({Key key, @required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TaskScreenState();
  }
}

class TaskScreenState extends State<TaskScreen>{

List<Task> tasks = [
  Task(name: 'Task 1', points: 100, description: 'Do something', available: false),
  Task(name: 'Task 2', points: 100, description: 'Do something', available: true),
  Task(name: 'Task 3', points: 100, description: 'Do something', available: true),
  Task(name: 'Task 4', points: 200, description: 'Do something', available: false),
  Task(name: 'Task 5', points: 200, description: 'Do something', available: true),
  Task(name: 'Task 6', points: 200, description: 'Do something', available: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTheme.accentColor,
        title: Text(widget.category.name),
      ),
      backgroundColor: myTheme.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          childAspectRatio: 2,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: tasks.map((task) => new RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
            child: Text(task.points.toString()),
            padding: EdgeInsets.all(20),
            color: task.available ? widget.category.color : TaskColors.unavailable,
            onPressed: () {},)
          ).toList(),
          ),
      )
    );
  }
}
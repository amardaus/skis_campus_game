import 'package:flutter/material.dart';
import 'package:skis_campus_game/task.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class TaskScreen extends StatefulWidget{
  final Task task;

  const TaskScreen({Key key, @required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(backgroundColor: myTheme.accentColor, title: Text(widget.task.name),),
      body: Container()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:skis_campus_game/category.dart';
import 'package:skis_campus_game/task.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/task_dialog.dart';

class ChooseTaskScreen extends StatefulWidget{
  final Category category;

  ChooseTaskScreen({Key key, @required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskScreenState();
  }
}



class _TaskScreenState extends State<ChooseTaskScreen>{

  @override
  Widget build(BuildContext context) {

    List<Task> tasks = [  //get list of tasks of specific category from db
      Task(name: 'Task 1', points: 100, description: 'Do something', available: false, category: widget.category),
      Task(name: 'Task 2', points: 100, description: 'Do something', available: true, category: widget.category),
      Task(name: 'Task 3', points: 100, description: 'Do something', available: true ,category: widget.category),
      Task(name: 'Task 4', points: 200, description: 'Do something', available: false, category: widget.category),
      Task(name: 'Task 5', points: 200, description: 'Do something', available: true, category: widget.category),
      Task(name: 'Task 6', points: 200, description: 'Do something', available: true, category: widget.category),
    ];

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
          children: tasks.map((task) => new FlatButton(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
            child: Text(task.points.toString()),
            padding: EdgeInsets.all(20),
            disabledColor: TaskColors.diasbled,
            color: task.available ? widget.category.color : TaskColors.diasbled,
            onPressed: task.available ? 
            (){ showDialog(context: context, builder: (BuildContext context) => TaskDialog(task: task)); } 
            : null,
            /*onPressed: () {
              if(task.available){
                showDialog(context: context, builder: (BuildContext context) => TaskDialog(task: task));
              }
            },)*/
            )
          ).toList(),
          ),
      )
    );
  }
}
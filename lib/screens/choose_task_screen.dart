import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skis_campus_game/category.dart';
import 'package:skis_campus_game/models/tasklist.dart';
import 'package:skis_campus_game/task.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/task_dialog.dart';
import 'package:http/http.dart' as http;

class ChooseTaskScreen extends StatelessWidget{
  final Category category;

  ChooseTaskScreen({Key key, @required this.category}) : super(key: key);

  Future<TaskList> fetchTasks() async {
    final String url = "http://ec2-35-178-173-107.eu-west-2.compute.amazonaws.com:3000/tasks/math";
    final res = await http.get(url);
    if (res.statusCode == 200) {
        return TaskList.fromJson(json.decode(res.body));
    }

//https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
// ^^^^^^ tu pokazane ze trzeba zrobic klase i factory
    return null;
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<TaskList>(
        future: fetchTasks(),
        builder: (context, AsyncSnapshot<TaskList> snapshot){
          print(snapshot);
          if(snapshot.hasData){
            return Scaffold(
            appBar: AppBar(
              backgroundColor: myTheme.accentColor,
              title: Text("XD"),
            ),
            backgroundColor: myTheme.primaryColor,
            body: Center(
              //  nie 0 tylko nazwa!!!!!!!
              child: Text(snapshot.data.tasklist[0].name, style: Theme.of(context).textTheme.title,))
            );
          }
          else{
            return CircularProgressIndicator();
          }
        },
      );
    }
}


//https://stackoverflow.com/questions/44297839/how-to-transform-futurelistmap-to-listmap-in-dart-language

  /*@override
  Widget build(BuildContext context) {
    
    fetchTasks().then((val){
      print(s);
      print(val);
    });

    List<Task> tasks = [  //get list of tasks of specific category from db
      Task(name: 'Task 1', points: 100, available: true, category: widget.category, 
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
      Task(name: 'Task 2', points: 100, available: true, category: widget.category, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
      Task(name: 'Task 3', points: 100, available: true ,category: widget.category, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
      Task(name: 'Task 4', points: 200, available: false, category: widget.category, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
      Task(name: 'Task 5', points: 200, available: false, category: widget.category, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
      Task(name: 'Task 6', points: 200, available: true, category: widget.category, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',),
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
  }*/

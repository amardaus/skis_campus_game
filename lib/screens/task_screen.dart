import 'package:flutter/material.dart';
import 'package:skis_campus_game/task.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/time_counter.dart';

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
      body: Container(
        color: myTheme.primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/categories/tmp/resistor.png', height: 100), 
              color: widget.task.category.color
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              padding: EdgeInsets.all(20),
              child: Text(widget.task.description, style: TextStyle(fontSize: 16),),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  //Image.asset('assets/images/clock_white.png', height: 100,),
                  //TimeCounter(),
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CategoryScreen()));
                  RaisedButton(
                    child: Text("check time"),
                    onPressed: (){ 
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => TimeCounter()));
                  },)
                  //Text('6:29', style: TextStyle(fontSize: 30, color: Colors.white))
              ],),
            )
          ],
        ),
      )
    );
  }
}
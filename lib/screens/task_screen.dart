import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:skis_campus_game/models/singletask.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/time_counter.dart';

class TaskScreen extends StatefulWidget{
  final SingleTask task;

  const TaskScreen({Key key, @required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen>{

  

  Future<bool>_onWillPop(){
    return showDialog(context: context, 
      builder: (context) => new AlertDialog(
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var url = "http://ec2-3-8-188-67.eu-west-2.compute.amazonaws.com:3000/cancel_task";
              var body = {
                "name": widget.task.name,
                "category": widget.task.category.name.toLowerCase()
              };
              var bodyEncoded = json.encode(body);

              var res = await http.post(
                url,
                body: bodyEncoded,
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json"
                }
              );

              if(res.statusCode == 200){
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              }
              else{

              }
              
              //replace with named route!!!!!!!
            },
            child: Text("YES"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("NOPE"),
          ),
        ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
    ));
  }
}
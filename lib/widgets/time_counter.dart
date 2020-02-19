import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class TimeCounter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TimeCounterState();
  }
}

class _TimeCounterState extends State<TimeCounter>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: myTheme.accentColor,),
      //https://www.youtube.com/watch?v=tRe8teyf9Nk
      body: Center(child: 
        Text("Time left: ")
      ,),
      //body: Text("5:32", style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }
}
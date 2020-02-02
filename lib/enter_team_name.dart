import 'package:flutter/material.dart';

class EnterTeamName extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text('Enter team name', style: Theme.of(context).textTheme.title,),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
          decoration: InputDecoration(
            hintText: 'Teamname',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
                )
              )
              )
            )
      ]);
  }
}
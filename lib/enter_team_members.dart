import 'package:flutter/material.dart';
import 'widgets/member_text_field.dart';

class EnterTeamMembers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text('Enter team members', style: Theme.of(context).textTheme.title,),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(children: <Widget>[
            MemberTextField(),
            MemberTextField(),
            MemberTextField(),
          ],),  
        )
      ]);
  }
}
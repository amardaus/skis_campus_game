import 'package:flutter/material.dart';

class MemberTextField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new TextField(
    decoration: InputDecoration(
      hintText: 'Member name:',
      isDense: true, 
      contentPadding: EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
          )
      )
    );
  }
}
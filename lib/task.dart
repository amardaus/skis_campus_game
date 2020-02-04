import 'package:flutter/cupertino.dart';
import 'package:skis_campus_game/category.dart';

class Task{
  String name;
  int points;
  String description;
  bool available;
  Category category;

  Task({@required this.name, @required this.points, @required this.description, 
        @required this.available, @required this.category});
}
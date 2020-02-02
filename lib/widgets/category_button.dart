import 'package:flutter/material.dart';
import 'package:skis_campus_game/category.dart';

class CategoryButton extends StatelessWidget{
  final Category category;

  const CategoryButton({Key key, @required this.category}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: category.color,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Center(child: Text(category.name),)
        ),
      ),
    );
  }
}
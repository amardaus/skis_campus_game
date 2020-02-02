import 'package:flutter/material.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/category_button.dart';
import 'package:skis_campus_game/category.dart';

class CategoryScreen extends StatelessWidget {

  final List<Category> categories = [
    Category("Programming", CatColors.catBlue),
    Category("Hardware", CatColors.catGreen),
    Category("Cryptography", CatColors.catViolet),
    Category("Math", CatColors.catPink)]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.primaryColor,
      appBar: AppBar(title: Text('Categories'), backgroundColor: myTheme.accentColor),
      body:
      GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.all(20),
        children: <Widget>[
          CategoryButton(category: categories[0],),
          CategoryButton(category: categories[1],),
          CategoryButton(category: categories[2],),
          CategoryButton(category: categories[3],),
        ]
      )
    );
  }
}
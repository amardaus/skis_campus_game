import 'package:flutter/material.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/category_button.dart';
import 'package:skis_campus_game/category.dart';

class CategoryScreen extends StatelessWidget {

  final List<Category> categories = [
    Category("Programming", CatColors.catBlue, 'assets/images/categories/code.png'),
    Category("Hardware", CatColors.catGreen, 'assets/images/categories/hardware.png'),
    Category("Cryptography", CatColors.catViolet, 'assets/images/categories/crypto.png'),
    Category("Math", CatColors.catPink,'assets/images/categories/math.png'
  )]; 

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
        children: categories.map((item) => new CategoryButton(category: item)).toList(),
      )
    );
  }
}
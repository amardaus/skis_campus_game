import 'package:flutter/material.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class Category{
  String name;
  Color color;
  String imgName;

  Category(String n, Color c, String i){
    this.name = n;
    this.color = c;
    this.imgName = i;
  }
}

/*final List<Category> categories = [
    Category("Programming", CatColors.catBlue, 'assets/images/categories/code.png'),
    Category("Hardware", CatColors.catGreen, 'assets/images/categories/hardware.png'),
    Category("Cryptography", CatColors.catViolet, 'assets/images/categories/crypto.png'),
    Category("Math", CatColors.catPink,'assets/images/categories/math.png'
  )]; */

final Map<String, Category> categories = {
"programming": Category("Programming", CatColors.catBlue, 'assets/images/categories/code.png'),
"math": Category("Math", CatColors.catPink,'assets/images/categories/math.png'),
"hardware": Category("Hardware", CatColors.catGreen, 'assets/images/categories/hardware.png'),
"cryptography": Category("Cryptography", CatColors.catViolet, 'assets/images/categories/crypto.png')
};
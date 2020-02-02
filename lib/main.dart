import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skis_campus_game/mytheme.dart';
import 'category_screen.dart';
import 'login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var teamName = prefs.getString('team_name');
  print(teamName);
  runApp(
    MaterialApp(
      theme: myTheme,
      home: teamName == null ? 
      LoginScreen() : CategoryScreen())
    //LoginScreen() : LoginScreen())
  );
}
    

    
//https://stackoverflow.com/questions/54377188/how-to-use-shared-preferences-to-keep-user-logged-in-flutter
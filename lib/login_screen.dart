import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skis_campus_game/mytheme.dart';
import 'category_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.primaryColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset(
              'assets/images/team.png',
              width: MediaQuery.of(context).size.width * 0.5),
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
                ),
              ),
          ),),
          RaisedButton(
            child: Text('Login'),
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('team_name', 'GEEKS');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CategoryScreen()));
          })
          ],),
      ),
      ),
    );
  }
}
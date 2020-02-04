import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skis_campus_game/screens/category_screen.dart';
import 'package:skis_campus_game/widgets/teammembers.dart';
import 'package:skis_campus_game/themes/mytheme.dart';
import 'package:skis_campus_game/widgets/teamname.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  bool teamNameEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.primaryColor,
      body: new Container(
        child: new Center(child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/team.png',
              width: MediaQuery.of(context).size.width * 0.5),
            
            !teamNameEntered ? EnterTeamName() : EnterTeamMembers(),

            RaisedButton(
            child: Text('Login'),
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if(!teamNameEntered) {
                prefs.setString('team_name', 'GEEKS');
                setState(() {
                  teamNameEntered = true;
                });
              }
              else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CategoryScreen()));
              }
          })
        ],)),
      ),
    );
  }
}
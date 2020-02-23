import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:skis_campus_game/models/singletask.dart';
import 'package:skis_campus_game/server_addr.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class TaskScreen extends StatefulWidget{
  final SingleTask task;

  const TaskScreen({Key key, @required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen>{
  String qrCode = "";

  Future scanQR() async{
    try{
      String qrCode = await BarcodeScanner.scan();
      setState(() {
        this.qrCode = qrCode;
      });
    }
    on PlatformException catch(e){
      if(e.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          this.qrCode = "Camera permission not granted";
        });
      }
      else{
        setState(() {
          this.qrCode = "Unknown error1";
        });
      }
    }
    on FormatException{
      setState(() {
        this.qrCode = "null (User returned before scanning anything)";
      });
    }
    catch(e){
      setState(() {
        this.qrCode = "Unknown error2";
      });
    }
    print(qrCode);
  }

  Future<bool>_onWillPop(){
    return showDialog(context: context, 
      builder: (context) => new AlertDialog(
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var url = URLaddr.serverAddr + URLaddr.cancelTask;
              var body = {
                "name": widget.task.name,
                "category": widget.task.category.name.toLowerCase()
              };
              var bodyEncoded = json.encode(body);

              var res = await http.post(
                url,
                body: bodyEncoded,
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json"
                }
              );

              if(res.statusCode == 200){
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              }
              else{

              }
              
              //replace with named route!!!!!!!
            },
            child: Text("YES"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("NOPE"),
          ),
          Text("QRcode:" + qrCode)
        ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      appBar: AppBar(backgroundColor: myTheme.accentColor, title: Text(widget.task.name),),
      body: Container(
        color: myTheme.primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/categories/tmp/resistor.png', height: 100), 
              color: widget.task.category.color
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              padding: EdgeInsets.all(20),
              child: Text(widget.task.description, style: TextStyle(fontSize: 16),),
            ),
            RaisedButton(
              child: Text("xddd"),
              onPressed: scanQR
            )
          ],
        ),
      )
    ));
  }
}
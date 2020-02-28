import 'package:flutter/material.dart';
import 'dart:io';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: Scaffold(
        appBar: AppBar(title: Text('Abusive content detection'),),
        body:  Center(
          child: ListView(
           children: <Widget>[
             TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the Text",
              ),
             ),
           RaisedButton(child: Text('Check'),)
           ],
          ),
        ),
        )
    );
}
}  

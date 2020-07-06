import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  var textdata = " ";
  bool _loading = false;
  final _textcontroller = new TextEditingController();
  fetchData() async {
 String uri='http://ec2-3-234-218-161.compute-1.amazonaws.com:8081/predict?data=';
 String a=uri+textdata;
    var response = await http
        .post(a);
     print(response.statusCode);
     print(response.body);
    data = json.decode(response.body);
    if (data['prediction'].toString() == '1') {
      setState(() {
        _loading = false;
        textdata = "You type abusive content";
      });
    } else {
      setState(() {
        _loading = false;
        textdata = _textcontroller.text;
      });
    }
    print(data);
  }

  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Abusive content detection'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the Text ",
              ),
            ),
            RaisedButton(
              child: Text('Check'),
               
              onPressed: () {
               
              setState(() {
                  _loading = true;
                  textdata = _textcontroller.text;
                  print(textdata);
                });
                print(textdata);
                fetchData();
               
              },
            ),
            _loading ? CircularProgressIndicator() : Text(textdata)
          ],
        ),
      ),
    ));
  }
}

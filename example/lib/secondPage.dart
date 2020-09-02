import 'dart:typed_data';

import 'package:bountifierwidget/extractArguments.dart';
//import 'package:bountifierwidget/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
//import 'package:bountifierwidget/getButton.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  GlobalKey _bountysskey = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test app")),
      body: RepaintBoundary(
        key: _bountysskey,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("Testing for bountifier"),
              Text("Testing for bountifier"),
              Text("Testing for bountifier"),
              Text("Testing for bountifier"),
              Text("Testing for bountifier"),
              Text("Testing for bountifier"),
              ExtractArgumentsScreen(),
            ],
          ),
        ),

        // child: RaisedButton(onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => ExtractArgumentsScreen(),));
        // }      ,),

        //child: ExtractArgumentsScreen(),
      ),
    );
  }
}

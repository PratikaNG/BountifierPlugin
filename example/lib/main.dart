import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bountifierwidget/extractArguments.dart';
//import 'package:bountifierwidget/getButton.dart';
import 'secondPage.dart';
//import 'package:bountifierwidget/urlCompletion.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:bountifierwidget/bountifierwidget.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    // routes: {
    //   ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
    // },
  ));
}

//String text = "2";



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  GlobalKey<ScaffoldState> key = new GlobalKey();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Bountifierwidget.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My test app'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text('This example app is running on: $_platformVersion\n'),
          new Padding(padding: EdgeInsets.all(50),),
          Text('This example app is running on: $_platformVersion\n'),
          new Padding(padding: EdgeInsets.all(50),),
          Text('This example app is running on: $_platformVersion\n'),
          ExtractArgumentsScreen(),
         
          // Container(child: new getButton(),)
        ]),
        
        
        

        ),
        
        

        // A button that navigates to a named route. The named route
// extracts the arguments by itself.

        // floatingActionButton: FloatingActionButton(
        //   child: Text("Report and Win"),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 SecondPage()));

        //   },
        // )
        

       
        );
  }
}

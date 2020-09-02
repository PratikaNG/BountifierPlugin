import 'dart:async';
//import 'package:bountifierwidget/form.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/gestures.dart';
//import 'package:http/http.dart' as http;


class Bountifierwidget {
  static const MethodChannel _channel = const MethodChannel('bountifierwidget');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

// class ScreenArguments {
//   //final String buttonName;
//   final String api;

//   ScreenArguments(this.api);
// }

// class ExtractArgumentsScreen extends StatefulWidget {

//   //String text;

//   _ExtractArgumentsScreen createState() => _ExtractArgumentsScreen();
//   static const routeName = '/extractArguments';

//  // ExtractArgumentsScreen({Key key, @required this.text}) : super(key: key);
// }

// A widget that extracts the necessary arguments from the ModalRoute.
// class ExtractArgumentsScreen extends StatelessWidget {
//   final String text;

//  ExtractArgumentsScreen({Key key, @required this.text}) : super(key: key);

//   Future<bool> myButton() async {
//     // Extract the arguments from the current ModalRoute settings and cast
//     // them as ScreenArguments.

//    // final ScreenArguments args = ModalRoute.of(context).settings.arguments;
//     String url = "https://reqres.in/userspage=" + text;
//     final response = await http.get(url);
//     // headers: {"Accept":"application/json"});

   
//       if (response.statusCode == 200) {
//       print(response.body);
//       return true;
//     } else{
//       return false;
//     } 
//   }

//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//         future: myButton(),
//         builder: (context, AsyncSnapshot<bool> snapshot) {
//           print(snapshot.data);
//           if (snapshot.data==true) {
//             return new BountyForm();
           
//           } else if (snapshot.data == false) {
//             return Text("Invalid api");
//           } else {
//             return Scaffold(
//                 body: Center(
//               child: CircularProgressIndicator(),
//             ));
//           }
//         });
//   }
// }


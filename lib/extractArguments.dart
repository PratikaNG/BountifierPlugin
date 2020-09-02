import 'package:bountifierwidget/getButton.dart';
import 'package:flutter/material.dart';
//import 'bountifierwidget.dart';
import 'package:http/http.dart' as http;
//import 'form.dart';
import 'urlCompletion.dart';
import 'dart:convert';




bool check = false;
String rest = "";

class ExtractArgumentsScreen extends StatelessWidget {
  // final String text;

//  ExtractArgumentsScreen({Key key, @required this.text}) : super(key: key);


Future<String> myButton() async{
  print("this is rest before http request");
  print(rest);

  String url = "https://bountifier.com/project/details-mobile?key=" + text;
  //String url = "https://reqres.in/api/users/" + text;
    final response = await http.get(url);
    //http.Response response = await http.get(url);
    var data = json.decode(response.body);
    print("rest after http request");
    rest = data["_id"];
    //rest = data["id"];
    print(rest);

  //String checkStatus(){
    if (response.statusCode == 200){
      //print(response.body);
      
      check = true;
        return text;
    }
    else
      return "Invalid";
  //}
}

  // Future<bool> myButton() async {
  //   // Extract the arguments from the current ModalRoute settings and cast
  //   // them as ScreenArguments.

  //  // final ScreenArguments args = ModalRoute.of(context).settings.arguments;
  //   String url = "https://reqres.in/userspage=" + text;
  //   final response = await http.get(url);
  //   // headers: {"Accept":"application/json"});

   
  //   //   if (response.statusCode == 200) {
  //   //   return true;
  //   // } else{
  //   //   return false;
  //   // } 
  // }

  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: myButton(),
        
        builder: (context, AsyncSnapshot<String> snapshot) {
          print(snapshot.data);
          //print(text);
          if (snapshot.data==text) {
            return GetButton();
           
          } else if (snapshot.data == "Invalid") {
            return Text("Invalid api");
          } else {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
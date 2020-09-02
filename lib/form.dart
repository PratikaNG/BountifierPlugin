import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'extractArguments.dart';
import 'package:http/http.dart' as http;
import 'urlCompletion.dart';
import 'dart:ui' as ui;

final TextEditingController nameController = TextEditingController();
final TextEditingController projectController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController keyController = TextEditingController();
final TextEditingController issueDetailsController = TextEditingController();
String name = nameController.text;
String mob = mobileController.text;
String issdet = issueDetailsController.text;
//GlobalKey _bountysskey = GlobalKey();
class BountyForm extends StatefulWidget {
  @override
  _BountyFormState createState() => _BountyFormState();
}

// Future<void> convertWidgetToImage() async {
//     RenderRepaintBoundary renderRepaintBoundary =
//         _bountysskey.currentContext.findRenderObject();
//     ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
//     ByteData byteData =
//         await boxImage.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List uint8list = byteData.buffer.asUint8List();
//   }

Future<bool> postdetails(String name, String key, String project, String mobile,
    String issueDetails, String url, String browser, String ss) async {
  //var r = await Requests.post("https://bountifier.com/issues/report",
  print("------This is before http post------");
  print(name);
  print(mobile);
  print(key);
  print(project);
  print(issueDetails);
  print(url);
  print(browser);
  print(ss);

  var issue_details = {
    "environment": {"browser": browser},
    "details": issueDetails,
    "url": url,
    "screenshot": ss
  };
  String a = jsonEncode(issue_details);

  var user_details = {"name": name, "mobile": mobile};
  String b = jsonEncode(user_details);
  var body = {
    "issue_details": a,
    "user_details": b,
    "project": project,
    "key": key,
  };

  String c = jsonEncode(body);
  print(c);

  //"https://bountifier.com/issues/report"
  final String posturl = "https://bountifier.com/issues/report-mobile";
  final response = await http.post(posturl,
      headers: {
        //"Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
        //"HttpHeaders.contentTypeHeader": "application/x-www-form-urlencoded"
      },
      body: {
        "issue_details": a,
        "user_details": b,
        "project": project,
        "key": key,
      },
      encoding: Encoding.getByName("utf-8")
      );
  print("The status code is:");
  print(response.statusCode);
  print(response);

  if (response.statusCode == 200) {
    return true;
  }

  return false;

  // if (response.statusCode == 200) {
  //   final String responseString = response.body;
  //   return welcomeFromJson(responseString);
  // } else {
  //   return null;
  // }
}

class _BountyFormState extends State<BountyForm> {
  static String _username = name;
  static String _issuedetails = issdet;
  static String _contact = mob;
  String _userprojid = rest;
  String _userkey = text;
  String _ss = "abc";
  String _url = "abc";
  String _browser = "android";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: "Your Name",
        border: OutlineInputBorder(),
      ),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
      onFieldSubmitted: (value) {
        setState(() {
          _username = value;
        });
      },
    );
  }

  Widget _buildproject() {
    return Offstage(
        offstage: true,
        child: TextFormField(
          controller: projectController,
          decoration: InputDecoration(
            labelText: "ID",
            border: OutlineInputBorder(),
          ),
          //maxLength: 10,
          validator: (String value) {
            if (value.isEmpty) {
              // setState(() {
              //   value = rest;
              //   _userprojid = value;
              // });
            }

            return null;
          },
          onFieldSubmitted: (value) {
            setState(() {
              _userprojid = rest;
            });
          },
        ));
  }

  Widget _buildKey() {
    return Offstage(
        offstage: true,
        child: TextFormField(
          controller: keyController,
          decoration: InputDecoration(
            labelText: "ID",
            border: OutlineInputBorder(),
          ),
          //maxLength: 10,
          validator: (String value) {
            if (value.isEmpty) {
              //return "please enter a name";
              // setState(() {
              //   value = text;
              //   _userkey = value;
              // });

            }

            return null;
          },
          onFieldSubmitted: (value) {
            setState(() {
              _userkey = text;
            });
          },
        ));
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: mobileController,
      decoration: InputDecoration(
        labelText: "phone number",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.length < 10) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _contact = value;
      },
      onFieldSubmitted: (value) {
        setState(() {
          _contact = value;
        });
      },
    );
  }

  Widget _buildIssueDetails() {
    return TextFormField(
      controller: issueDetailsController,
      decoration: InputDecoration(
        labelText: "ISSUE DETAILS:",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please report the issue details.';
        }

        return null;
      },
      onSaved: (String value) {
        _issuedetails = value;
      },
      onFieldSubmitted: (value) {
        setState(() {
          _issuedetails = value;
        });
      },
    );
  }

  Widget _buildThankyou() {
    return Container(child: Text("Thank You!"));
  }

  Widget _buildUnsuccessful() {
    return Container(child: Text("Couldn't report the issue! try again"));
  }

  final poweredby = RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 12.0),
      children: <TextSpan>[
        TextSpan(text: 'Powered by '),
        TextSpan(
            text: 'Bountifier',
            style: TextStyle(color: Colors.red),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // print('Terms of Service"');
              }),
      ],
    ),
  );
  final description = RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      children: <TextSpan>[
        TextSpan(
            text:
                'Any problem on the app? Report here and earn cash on your paytm account.For details '),
        TextSpan(
            text: 'click here',
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {}),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report an issue"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child:
            //  (_futureDetails == null)?
            Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  description,
                  Divider(),
                  _buildIssueDetails(),
                  Divider(),
                  _buildName(),
                  Divider(),
                  _buildPhoneNumber(),
                  Divider(),
                  _buildproject(),
                  Divider(),
                  _buildKey(),
                  poweredby,
                  Divider(),
                  SizedBox(height: 0),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () async {
                      bool user = await postdetails(
                          _username,
                          _userkey,
                          _userprojid,
                          _contact,
                          _issuedetails,
                          _url,
                          _browser,
                          _ss);

                      // if (!_formKey.currentState.validate()) {
                      //   return;
                      // }
                      // _formKey.currentState.save();
                      print("The details collected from the form are: ");
                      print(_username);
                      print(_contact);
                      print(_userprojid);
                      print(_issuedetails);
                      print(_userkey);
                      if (user == true) 
                        return _buildThankyou();
                      else
                        return _buildUnsuccessful();
                    
                      // else null;
                      // setState(() {

                      // });
                      
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

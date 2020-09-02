import 'package:flutter/material.dart';
import 'form.dart';
import 'extractArguments.dart';
import 'package:http/http.dart' as http;
import 'checkStatus.dart';

class GetButton extends StatefulWidget {
  @override
  _GetButtonState createState() => _GetButtonState();
}

class _GetButtonState extends State<GetButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 50),

      child: Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
              color: Colors.black,
              child: Text(
                "Report and Win",
              ),
              textColor: Colors.white,
              onPressed: () {
                //convertWidgetToImage();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BountyForm()));
              })),

      // setState(() {
      //   Visibility(
      //     visible: check,);
      // }

      // );

// Call form
    );
  }
}

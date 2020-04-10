import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/qrcode.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: TextField(
              cursorColor: Colors.amber,
              onChanged: (val) {
                value = val;
              },
              autofocus: false,
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Colors.amber,
                focusColor: Colors.amber,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                hintText: 'Text/Link',
                helperText: 'Example: https://www.google.com/',
              ),
            ),
          ),
          // SizedBox(height: 30.0),
          RaisedButton(
            child: Text('Generate', style: TextStyle(color: Colors.white)),
            color: Colors.amber,
            shape: StadiumBorder(),
            onPressed: () {
              if (value != "") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QrCode(
                      text: value,
                    ),
                  ),
                );
              } else {
                showPlatformDialog(
                  context: context,
                  builder: (_) => PlatformAlertDialog(
                    title: Text('QR Code'),
                    content: Text('Enter some text to generate QR Code'),
                    actions: <Widget>[
                      PlatformDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: TextField(
              onChanged: (val) {
                value = val;
              },
              autofocus: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
                helperText: 'https://www.google.com/',
              ),
            ),
          ),
          // SizedBox(height: 30.0),
          PlatformButton(
            child: Text('Generate'),
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

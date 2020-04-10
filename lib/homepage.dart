import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/qrcode.dart';

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
          CupertinoButton.filled(
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
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: Text('QR Code'),
                    content: Text('Enter Link or Text to generate QR Code'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: (){
                          Navigator.pop(context);
                        },
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

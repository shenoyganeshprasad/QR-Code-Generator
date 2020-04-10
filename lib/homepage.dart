import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onChanged: (val){
                value = val;
              },
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
                helperText: 'https://www.google.com/',
              ),
            ),
          ),
          // SizedBox(height: 30.0),
          CupertinoButton.filled(child: Text('Generate'), onPressed: () {
            print(value);
          })
        ],
      ),
    );
  }
}

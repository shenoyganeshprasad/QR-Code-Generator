import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  final String text;
  QrCode({this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
            'https://api.qrserver.com/v1/create-qr-code/?size=${size}x$size&data=$text',
          ),
        ),
      ),
    );
  }
}

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRShow extends StatefulWidget {
  @override
  _QRShow createState() => _QRShow();
}

class _QRShow extends State<QRShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('TEST MODE'),
          backgroundColor: Colors.redAccent),
      body: QrImage(
        data: "1234567890",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}

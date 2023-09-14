import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRScanScreen extends StatelessWidget {
  static const routeName = '/qr-scan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('QR Code Scan'),
      ),
      body: Center(
        child: Text("SCAN QR"),
      ),
    );
  }
}

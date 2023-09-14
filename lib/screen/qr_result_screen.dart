import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'home_screen.dart';

class QRResultScreen extends StatelessWidget {
  static const routeName = '/qr-result';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final code = args.code;
    final closeScreen = args.function;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Result QR Code'),
        leading: IconButton(
          onPressed: () {
            closeScreen.call();
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                "Scanned Result",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      code,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

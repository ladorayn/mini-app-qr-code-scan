import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_app/screen/qr_result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MobileScannerController cameraController = MobileScannerController();

  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('QR Scanner'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR Code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MobileScanner(
                onDetect: (capture) {
                  if (!isScanCompleted) {
                    final List<Barcode> barcodes = capture.barcodes;
                    String code = "--";
                    for (final barcode in barcodes) {
                      code = barcode.rawValue!;
                      break;
                    }
                    isScanCompleted = true;
                    Navigator.of(context).pushNamed(
                      QRResultScreen.routeName,
                      arguments: ScreenArguments(
                        code,
                        closeScreen,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(code)));
                  }
                },
              ),
              flex: 4,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Developed by Lado",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String code;
  final Function function;

  ScreenArguments(this.code, this.function);
}

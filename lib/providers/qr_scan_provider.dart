import 'package:flutter/cupertino.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerProvider with ChangeNotifier {
  bool isScanCompleted = false;
  MobileScannerController cameraController = MobileScannerController();

  void closeScreen() {
    isScanCompleted = !isScanCompleted;
    notifyListeners();
  }

  void setScanComplete() {
    isScanCompleted = true;
    notifyListeners();
  }
}

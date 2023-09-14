import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/qr_scan_provider.dart';
import 'package:qr_app/screen/home_screen.dart';
import 'package:qr_app/screen/qr_result_screen.dart';
import 'package:qr_app/screen/qr_scan_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QRScannerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scan App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFB11016),
          ),
          primaryColor: Color(0xFFB11016),
          accentColor: Color(0xFF289672),
          fontFamily: 'Lato',
        ),
        home: HomeScreen(),
        routes: {
          QRResultScreen.routeName: (ctx) => QRResultScreen(),
        },
      ),
    );
  }
}

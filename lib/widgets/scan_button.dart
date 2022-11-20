import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: <Future>() async {
        /* final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);*/
        String barcodeScanRes = "https://www.disneyplus.com";
        print(barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

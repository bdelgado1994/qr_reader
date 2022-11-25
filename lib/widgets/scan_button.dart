import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_privider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        /* final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);*/
        String barcodeScanRes = "https://www.disneyplus.com";
        final scanListProvoder =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvoder.newScan(barcodeScanRes);
        scanListProvoder.newScan('geo:15.33,15.16');
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/utils/utils.dart';

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
        //scanListProvoder.newScan(barcodeScanRes);
        final nuevoScan =
            await scanListProvoder.newScan('geo:12.101689, -86.267131');
        launchURL(nuevoScan, context);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

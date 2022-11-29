import 'package:flutter/material.dart';
import 'package:qrreader/models/db_provider.dart';

class MapaScreen extends StatelessWidget {
  const MapaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    debugPrint(scan.valor);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapas'),
        ),
        body: const Center(
          child: Text('Mapas'),
        ));
  }
}

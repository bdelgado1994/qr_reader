import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/widgets/scan_tiles.dart';

import '../providers/scan_list_privider.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'geo');
  }
}

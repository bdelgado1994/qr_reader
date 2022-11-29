import 'package:flutter/material.dart';
import '../widgets/scan_tiles.dart';

class DirrecionesScreen extends StatelessWidget {
  const DirrecionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'http');
  }
}

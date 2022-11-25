import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_privider.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvoder = Provider.of<ScanListProvider>(context);
    final scans = scanListProvoder.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => debugPrint('Open Something ${index + 1}'),
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}

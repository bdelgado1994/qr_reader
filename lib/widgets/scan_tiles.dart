import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/utils/utils.dart';

import '../providers/scan_list_privider.dart';

class ScanTiles extends StatelessWidget {
  final String type;
  const ScanTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvoder = Provider.of<ScanListProvider>(context);
    final scans = scanListProvoder.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteById(scans[index].id!);
        },
        child: ListTile(
          onTap: () => launchURL(scans[index], context),
          leading: Icon(
            type == 'geo' ? Icons.map : Icons.home_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

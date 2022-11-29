import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_privider.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/screens/direccion_screen.dart';
import 'package:qrreader/screens/mapas_screen.dart';
import 'package:qrreader/widgets/scan_button.dart';
import 'package:qrreader/widgets/custom_navigatior_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              final scanListProvider =
                  Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.deleteAll();
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
    );
  }
}

//
class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    // DBProvider.db;
    //DBProvider.db.initDB();
    //final ScanModel tempScan = ScanModel(valor: 'http://www.goolgle.com');
    //DBProvider.db.newScan(tempScan);
    //DBProvider.db.getScanById(6).then((value) => debugPrint('${value?.valor}'));
    //DBProvider.db.getAllScan().then((value) => print(value));
    //DBProvider.db.deleteAllScan().then((value) => print('$value'));
    final scanListProvoder =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvoder.loaddingScansByType('geo');
        return const MapasScreen();
      case 1:
        scanListProvoder.loaddingScansByType('http');
        return const DirrecionesScreen();
      default:
        return const MapasScreen();
    }
  }
}

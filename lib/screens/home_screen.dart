import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            onPressed: () {},
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
    switch (currentIndex) {
      case 0:
        return const MapasScreen();
      case 1:
        return const DirrecionesScreen();
      default:
        return const MapasScreen();
    }
  }
}

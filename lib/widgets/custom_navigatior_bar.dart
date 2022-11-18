import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    int currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => currentIndex = value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones')
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_qr_scanner/provider/ui_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.getSelectMenuOp;
    return BottomNavigationBar(
      onTap: (value) => uiProvider.setSelectMenuOp = value,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Mapa',
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
            label: 'Direcciones', icon: Icon(Icons.compare_arrows_sharp)),
      ],
    );
  }
}

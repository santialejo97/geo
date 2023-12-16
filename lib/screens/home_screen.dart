import 'package:fl_qr_scanner/model/scan_model.dart';
import 'package:fl_qr_scanner/provider/db_provider.dart';
import 'package:fl_qr_scanner/provider/scans_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_qr_scanner/provider/ui_provider.dart';
import 'package:fl_qr_scanner/screens/screens.dart';
import 'package:fl_qr_scanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScansProvider>(context, listen: false);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      appBar: AppBar(
        title: const Text(
          'Historial',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 20,
        actions: [
          IconButton(
            onPressed: () {
              scanProvider.clearScans();
            },
            icon: const Icon(Icons.delete_forever, color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          )
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    // final temp = ScanModel(value: 'http://google.com');
    // DBProvider.db.deleteScans().then(print);

    // *Usar provider de scan
    final scanProvider = Provider.of<ScansProvider>(context, listen: false);

    final currentIndex = uiProvider.getSelectMenuOp;
    switch (currentIndex) {
      case 0:
        scanProvider.uploadScanByTipo('GEO');
        return const HistoryMapScreen();
      case 1:
        scanProvider.uploadScanByTipo('http');
        return const DireccionesScreen();
      default:
        return const HistoryMapScreen();
    }
  }
}

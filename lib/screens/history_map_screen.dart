import 'package:fl_qr_scanner/model/scan_model.dart';
import 'package:fl_qr_scanner/provider/scans_provider.dart';

import 'package:fl_qr_scanner/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryMapScreen extends StatelessWidget {
  const HistoryMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScansProvider>(context);
    final List<ScanModel> listScan = scanProvider.listScans;
    return CustomListTile(listScan: listScan);
  }
}

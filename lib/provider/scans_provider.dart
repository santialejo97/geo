import 'package:fl_qr_scanner/model/scan_model.dart';
import 'package:fl_qr_scanner/provider/db_provider.dart';
import 'package:flutter/foundation.dart';

class ScansProvider extends ChangeNotifier {
  List<ScanModel> listScans = [];
  String tipoSeleccionado = 'http';

  generateScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    if (tipoSeleccionado == newScan.tipo) {
      listScans.add(newScan);
      notifyListeners();
    }
  }

  uploadScans() async {
    final list = await DBProvider.db.getListScans();
    listScans = [...list];
    notifyListeners();
  }

  uploadScanByTipo(String tipo) async {
    final list = await DBProvider.db.getListScansByTipo(tipo);
    tipoSeleccionado = tipo;
    listScans = [...list];
    notifyListeners();
  }

  clearScans() async {
    await DBProvider.db.deleteScans();
    listScans = [];
    notifyListeners();
  }

  clearScansById(int id) async {
    await DBProvider.db.deleteScanById(id);
    uploadScans();
  }
}

import 'package:fl_qr_scanner/provider/scans_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void scannerQrCode() async {
      // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      //     '#3D8BEF', 'Cancelar Scanneo', false, ScanMode.QR);
      String barcodeScanRes = 'https://youtu.be/XKfp4A21dw4?list=RDXKfp4A21dw4';
      final scanProvider = Provider.of<ScansProvider>(context, listen: false);
      scanProvider.generateScan(barcodeScanRes);
      scanProvider.generateScan('GEO:15,33,45');
    }

    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: scannerQrCode,
      elevation: 10,
      child: const Icon(
        Icons.qr_code_2_rounded,
        color: Colors.white,
      ),
    );
  }
}

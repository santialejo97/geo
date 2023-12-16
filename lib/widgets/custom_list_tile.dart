import 'package:fl_qr_scanner/model/scan_model.dart';
import 'package:fl_qr_scanner/theme/theme_dark.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.listScan,
  });

  final List<ScanModel> listScan;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
        onTap: () {
          print(listScan[index].id);
        },
        title: Text(
          listScan[index].value,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.map,
          color: ThemeDark.primaryColor,
        ),
        subtitle: Text('ID : ${listScan[index].id}'),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.grey,
        ),
      ),
      itemCount: listScan.length,
    );
  }
}

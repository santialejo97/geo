import 'package:fl_qr_scanner/provider/scans_provider.dart';
import 'package:fl_qr_scanner/provider/ui_provider.dart';
import 'package:fl_qr_scanner/screens/screens.dart';
import 'package:fl_qr_scanner/theme/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => UiProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ScansProvider())
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          initialRoute: 'Home',
          routes: {
            'Home': (BuildContext context) => const HomeScreen(),
            'Mapa': (BuildContext context) => const MapScreen(),
          },
          theme: ThemeDark.themeDark),
    );
  }
}

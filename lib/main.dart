import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl_v1/MenuScreens/Menu Surah.dart';
import 'package:pbl_v1/MenuScreens/PemulaMenu.dart';
import 'package:pbl_v1/ButtonWidgets/SpecialRuleButton.dart';
import 'package:pbl_v1/onboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Quran Apps',
      home: const Splash(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl_v1/MenuScreens/Menu Surah.dart';
import 'package:pbl_v1/MenuScreens/PemulaMenu.dart';
import 'package:pbl_v1/ButtonWidgets/SpecialRuleButton.dart';

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
      home: const MyHomePage(title: 'Learn Quran Apps Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToDarjahMenu() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, _, __) => MenuSurah(),
      ),
    );
  }

  void _navigateToPemula() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, _, __) => PemulaMenu(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // COLUMN 1 (DARJAH 1, DARJAH 4, SPECIAL RULE)
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BUTTON TO DARJAH 1
            HomeMenu_Button(
              text: 'Siri Pri-Pemula',
              onPressed: _navigateToPemula,
            ),

            const SizedBox(
              height: 15,
            ),

            HomeMenu_Button(
              text: 'Siri Surah',
              onPressed: _navigateToDarjahMenu,
            ),
          ],
        ),
      ),
    );
  }
}

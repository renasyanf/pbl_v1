import 'package:flutter/material.dart';
import 'package:pbl_v1/DarjahScreens/Darjah1-1.dart';
import 'package:pbl_v1/DarjahScreens/speech.dart';
import 'package:pbl_v1/OtherScreen/Tajwid.dart';
import 'package:pbl_v1/ButtonWidgets/Button.dart';
import 'package:pbl_v1/Surah/Alfalaq.dart';
import 'package:pbl_v1/Surah/Annaas.dart';
import 'package:pbl_v1/Surah/Alikhlas.dart';
import 'package:pbl_v1/Surah/Alfatihah.dart';
//import 'package:pbl_v1/Surah/Alfatihahdb.dart';
import 'dart:ui';

class MenuSurah extends StatelessWidget {
  const MenuSurah({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 852;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(12, 255, 255, 255),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // headerbarg8f (8:115)
                width: double.infinity,
                height: 100 * fem,
                decoration: const BoxDecoration(
                  color:Color.fromARGB(12, 255, 255, 255),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // navheader1Aw (8:116)
                      left: 29 * fem,
                      top: 40 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 794 * fem,
                          height: 52 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11 * fem),
                              color: const Color(0xffdbea8d),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0f000000),
                                  offset: Offset(0 * fem, 2 * fem),
                                  blurRadius: 2 * fem,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // tahap1qsalfatihah1fmH (8:117)
                      left: 85 * fem,
                      top: 57 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 186 * fem,
                          height: 20 * fem,
                          child: Text(
                            'Siri Surah',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.1918749809 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // moreZ5y (8:118)
                      left: 801 * fem,
                      top: 58 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 4 * fem,
                          height: 16 * fem,
                          child: Image.asset(
                            'assets/page-1/images/more.png',
                            width: 4 * fem,
                            height: 16 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 47 * fem,
                      top: 56 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 16 * fem,
                          height: 16 * fem,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tombol Kembali
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Image.asset(
                              'assets/page-1/images/back-9ks.png',
                              width: 16 * fem,
                              height: 16 * fem,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space here
              // Menu Items
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SurahButton(
                          text: 'Surah Al Fatihah',
                          onPressed: () => _navigateToAlfatihah(context),
                        ),
                        const SizedBox(width: 15),
                        SurahButton(
                          text: 'Surah An Naas',
                          onPressed: () => _navigateToAnnas(context),
                        ),
                        const SizedBox(width: 15),
                        SurahButton(
                          text: 'Surah Al Falaq',
                          onPressed: () => _navigateToAlFalaq(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SurahButton(
                          text: 'Surah Al Ikhlas',
                          onPressed: () => _navigateToAlikhlas(context),
                        ),
                        const SizedBox(width: 15),
                        SurahButton(
                          text: 'Tajwid',
                          onPressed: () => _navigateToTajwid(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SurahButton(
                          text: 'Speech',
                          onPressed: () => _navigateToDarjah(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAlfatihah(BuildContext context) {
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
        pageBuilder: (context, _, __) => Alfatihah(),
      ),
    );
  }

  void _navigateToAnnas(BuildContext context) {
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
        pageBuilder: (context, _, __) => Annaas(),
      ),
    );
  }

  void _navigateToAlFalaq(BuildContext context) {
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
        pageBuilder: (context, _, __) => Alfalaq(),
      ),
    );
  }

  void _navigateToAlikhlas(BuildContext context) {
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
        pageBuilder: (context, _, __) => Alikhlas(),
      ),
    );
  }

  void _navigateToTajwid(BuildContext context) {
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
        pageBuilder: (context, _, __) => const Tajwid1Screen(),
      ),
    );
  }

  void _navigateToDarjah(BuildContext context) {
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
        pageBuilder: (context, _, __) =>  SpeechScreen(),
      ),
    );
  }
}

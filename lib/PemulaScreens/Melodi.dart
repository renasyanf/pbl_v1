import 'package:flutter/material.dart';
import 'package:pbl_v1/DarjahScreens/Darjah1-1.dart';
import 'package:pbl_v1/DarjahScreens/Darjah2-1.dart';
import 'package:pbl_v1/OtherScreen/Tajwid.dart';
import 'package:pbl_v1/ButtonWidgets/PemulaButton.dart';


class Melodi extends StatelessWidget {
  const Melodi({super.key});

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
                  color: Color(0xffffffff),
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
                            'Melodi Pra Pemula',
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
              const SizedBox(height: 20), // Add space here
              // Menu Items
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        PemulaButton(
                          text: 'Belajar tiga dalam satu (asas, tajwid, melodi)',
                          onPressed: () => _navigateToDarjah1(context),
                        ),
                        const SizedBox(height: 15),
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

  void _navigateToDarjah1(BuildContext context) {
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
        pageBuilder: (context, _, __) => const Darjah1Screen(),
      ),
    );
  }

  void _navigateToDarjah2(BuildContext context) {
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
        pageBuilder: (context, _, __) => Darjah2Screen(),
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
        pageBuilder: (context, _, __) =>  QuranPage(),
      ),
    );
  }

}
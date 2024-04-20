import 'package:flutter/material.dart';

class Darjah1DuaScreen extends StatelessWidget {
  const Darjah1DuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 852;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // darjah119Pd (8:103)
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // headerbarg8f (8:115)
              width: double.infinity,
              height: 68*fem,
              decoration: const BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // navheader1Aw (8:116)
                    left: 29*fem,
                    top: 16*fem,
                    child: Align(
                      child: SizedBox(
                        width: 794*fem,
                        height: 52*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(11*fem),
                            color: const Color(0xffdbea8d),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x0f000000),
                                offset: Offset(0*fem, 2*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tahap1qsalfatihah1fmH (8:117)
                    left: 85*fem,
                    top: 33*fem,
                    child: Align(
                      child: SizedBox(
                        width: 186*fem,
                        height: 20*fem,
                        child: Text(
                          'Tahap 1 - QS Al Fatihah: 2',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.1918749809*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // moreZ5y (8:118)
                    left: 801*fem,
                    top: 34*fem,
                    child: Align(
                      child: SizedBox(
                        width: 4*fem,
                        height: 16*fem,
                        child: Image.asset(
                          'assets/page-1/images/more.png',
                          width: 4*fem,
                          height: 16*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 47 * fem,
                    top: 34 * fem,
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
            Container(
              // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
              padding: EdgeInsets.fromLTRB(103*fem, 22*fem, 26*fem, 16*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // contentimageWQX (8:131)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 22*fem),
                    width: 720*fem,
                    height: 126*fem,
                    child: Image.asset(
                      'assets/page-1/images/contentimage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // actionbuttonRnP (8:143)
                    margin: EdgeInsets.fromLTRB(420*fem, 0*fem, 0*fem, 33*fem),
                    padding: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    height: 54*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // videobuttonwkj (8:108)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(19*fem, 14*fem, 45*fem, 15*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: const Color(0xffdbea8d),
                            borderRadius: BorderRadius.circular(16*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // playduotoneqr7 (8:112)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                width: 24*fem,
                                height: 24*fem,
                                child: Image.asset(
                                  'assets/page-1/images/playduotone.png',
                                  width: 24*fem,
                                  height: 24*fem,
                                ),
                              ),
                              Container(
                                // videoA7h (8:111)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Video',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.1918749128*ffem/fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // frameaudiobutton4is (8:132)
                          width: 139*fem,
                          height: double.infinity,
                          child: Container(
                            // audiobuttoncVV (8:133)
                            padding: EdgeInsets.fromLTRB(19*fem, 14*fem, 45*fem, 15*fem),
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: const Color(0xffdbea8d),
                              borderRadius: BorderRadius.circular(16*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // soundmaxduotoneioR (8:137)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                  width: 24*fem,
                                  height: 24*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/soundmaxduotone.png',
                                    width: 24*fem,
                                    height: 24*fem,
                                  ),
                                ),
                                Container(
                                  // audiopLf (8:136)
                                  margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'Audio',
                                    style: TextStyle(
                                    fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      height: 1.1918749128*ffem/fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // footerbarXVy (8:120)
                    margin: EdgeInsets.fromLTRB(68*fem, 0*fem, 145*fem, 0*fem),
                    width: double.infinity,
                    height: 52*fem,
                    decoration: BoxDecoration (
                      color: const Color(0xffdbea8d),
                      borderRadius: BorderRadius.circular(11*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x0f000000),
                          offset: Offset(0*fem, 2*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle781g3 (8:122)
                          left: 166*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 178*fem,
                              height: 52*fem,
                              child: Container(
                                decoration: const BoxDecoration (
                                  color: Color(0xffd9d9d9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // arrowleftvY7 (8:123)
                          left: 69 * fem,
                          top: 14 * fem,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Tombol Kembali
                            },
                            child: Align(
                              alignment: Alignment.topLeft, // Sesuaikan sesuai kebutuhan Anda
                              child: SizedBox(
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/arrowleft.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),


                        Positioned(
                          // arrowrightF4b (8:125)
                          left: 422*fem,
                          top: 14*fem,
                          child: Align(
                            child: SizedBox(
                              width: 24*fem,
                              height: 24*fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/arrowright.png',
                                  width: 24*fem,
                                  height: 24*fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // menuM7d (8:127)
                          left: 244*fem,
                          top: 14*fem,
                          child: Align(
                            child: SizedBox(
                              width: 24*fem,
                              height: 24*fem,
                              child: Image.asset(
                                'assets/page-1/images/menu.png',
                                width: 24*fem,
                                height: 24*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
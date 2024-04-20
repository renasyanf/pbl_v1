import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

class MyHeader extends SliverPersistentHeaderDelegate {
  final double fem;
  final double ffem;

  MyHeader({required this.fem, required this.ffem});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 29 * fem,
            top: 16 * fem,
            child: Align(
              child: SizedBox(
                width: 794 * fem,
                height: 52 * fem,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11 * fem),
                    color: Color(0xffdbea8d),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0f000000),
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
            left: 85 * fem,
            top: 33 * fem,
            child: Align(
              child: SizedBox(
                width: 186 * fem,
                height: 20 * fem,
                child: Text(
                  'Tahap 2 - QS Al Fatihah: 1',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.1918749809 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 801 * fem,
            top: 34 * fem,
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
    );
  }

  @override
  double get maxExtent => 68 * fem;

  @override
  double get minExtent => 68 * fem;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Darjah2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 852;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MyHeader(fem: fem, ffem: ffem),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.fromLTRB(50 * fem, 8 * fem, 9 * fem, 3 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 29 * fem, 12 * fem),
                      width: 738 * fem,
                      height: 351 * fem,
                      child: Image.asset(
                        'assets/page-1/images/contentimage-nPH.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 28 * fem, 13 * fem),
                      width: 413 * fem,
                      height: 25 * fem,
                      child: Image.asset(
                        'assets/page-1/images/contentimage-1-JZV.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(420 * fem, 0 * fem, 0 * fem, 33 * fem),
                      padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      height: 54 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(19 * fem, 14 * fem, 45 * fem, 15 * fem),
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffdbea8d),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14 * fem, 0 * fem),
                                  width: 24 * fem,
                                  height: 24 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/playduotone.png',
                                    width: 24 * fem,
                                    height: 24 * fem,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Video',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.1918749128 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 139 * fem,
                            height: double.infinity,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(19 * fem, 14 * fem, 45 * fem, 15 * fem),
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffdbea8d),
                                borderRadius: BorderRadius.circular(16 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14 * fem, 0 * fem),
                                    width: 24 * fem,
                                    height: 24 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/soundmaxduotone.png',
                                      width: 24 * fem,
                                      height: 24 * fem,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    child: Text(
                                      'Audio',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.1918749128 * ffem / fem,
                                        color: Color(0xff000000),
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
                      margin: EdgeInsets.fromLTRB(68 * fem, 0 * fem, 170 * fem, 30 * fem),
                      width: 510 * fem,
                      height: 52 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffdbea8d),
                        borderRadius: BorderRadius.circular(11 * fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0f000000),
                            offset: Offset(0 * fem, 2 * fem),
                            blurRadius: 2 * fem,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 166 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 178 * fem,
                                height: 52 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 69 * fem,
                            top: 14 * fem,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Tombol Kembali
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
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
                            left: 422 * fem,
                            top: 14 * fem,
                            child: GestureDetector(
                              onTap: () {
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
                              },
                              child: Align(
                                child: SizedBox(
                                  width: 24 * fem,
                                  height: 24 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/arrowright.png',
                                    width: 24 * fem,
                                    height: 24 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 244 * fem,
                            top: 14 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/menu.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
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
            ]),
          ),
        ],
      ),
    );
  }
}

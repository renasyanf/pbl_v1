import 'package:flutter/material.dart';

class Tajwid1Screen extends StatelessWidget {
  const Tajwid1Screen({Key? key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 852;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double appBarHeight = 100 * fem; // Sesuaikan tinggi SliverAppBar sesuai kebutuhan

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            //expandedHeight: appBarHeight,
            flexibleSpace: Container(
              height: 330 * fem,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 29 * fem,
                    top: 34 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 794 * fem,
                        height: 47 * fem,
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
                    left: 85 * fem,
                    top: 48 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 186 * fem,
                        height: 25 * fem,
                        child: Text(
                          'Rules',
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
                    left: 801 * fem,
                    top: 49 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 4 * fem,
                        height: 13 * fem,
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
                    top: 49 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 14 * fem,
                        height: 14 * fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/back-9ks.png',
                            width: 20 * fem,
                            height: 20 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
               color: Color(0xffffffff),
              margin: EdgeInsets.fromLTRB(7 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 703 * fem,
              height: 531 * fem,
              child: Image.asset(
                'assets/page-1/images/contentimage-ZA7.png',
                fit: BoxFit.contain, // Sesuaikan dengan kebutuhan
              ),
            ),
          ),
        ],
      ),
    );
  }
}

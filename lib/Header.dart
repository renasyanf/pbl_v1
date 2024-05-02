import 'package:flutter/material.dart';

class Header extends SliverPersistentHeaderDelegate {
  final double fem;
  final double ffem;
  final String title;

  Header({required this.fem, required this.ffem, required this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 29 * fem,
            top: 40 * fem,
            child: Align(
              child: SizedBox(
                width: 794 * fem,
                height: 80 * fem,
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
            top: 57 * fem,
            child: Align(
              child: SizedBox(
                width: 186 * fem,
                height: 20 * fem,
                child: Text(
                  title,
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
    );
  }

  @override
  double get maxExtent => 68 * fem;

  @override
  double get minExtent => 68 * fem;

  @override
  bool shouldRebuild(covariant Header oldDelegate) {
    return title != oldDelegate.title;
  }
}

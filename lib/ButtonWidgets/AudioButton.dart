import 'package:flutter/material.dart';

class AudioButton extends StatelessWidget {
  final VoidCallback? onPressed;

  AudioButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(19, 14, 45, 15),
        width: 139,
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(219, 234, 141, 1.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/page-1/images/soundmaxduotone.png',
                width: 24,
                height: 24,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
              child: Text(
                'Audio',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.1918749128,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';

class DarjahButton extends StatelessWidget {
  final String text;
  final String number;
  final VoidCallback onPressed;

  const DarjahButton({
    Key? key,
    required this.text,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(209, 83),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: const Color.fromRGBO(219, 234, 141, 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 29 / 24,
              letterSpacing: 0,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFE8B643),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 39 / 32,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

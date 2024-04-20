import 'package:flutter/material.dart';

class SurahButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SurahButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
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
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 29 / 24,
              letterSpacing: 0,
              color: Colors.black,
            ),
          ),
        ], // ini adalah penutup kurung siku
      ),
    );
  }
}

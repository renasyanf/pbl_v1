import 'package:flutter/material.dart';

class HomeMenu_Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const HomeMenu_Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(330, 83),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: const Color.fromRGBO(219, 234, 141, 1.0),
      ),
      child: Text(
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
    );
  }
}

// special rule & tajwid
class SpecialRule_TajwidButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SpecialRule_TajwidButton({
    Key? key,
    required this.text,
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
      child: Text(
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
    );
  }
}

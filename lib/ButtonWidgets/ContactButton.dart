import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon; // Menambahkan IconData untuk menentukan ikon

  const ContactButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon, // Menambahkan parameter icon
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
          Icon(
            icon,
            color: Colors.black, // Mengatur warna ikon menjadi hitam
          ),
          const SizedBox(width: 8), // Menambahkan jarak antara ikon dan teks
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
        ],
      ),
    );
  }
}

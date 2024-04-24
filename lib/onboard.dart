import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl_v1/MenuScreens/Menu Surah.dart';
import 'package:pbl_v1/Homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();

    // Set orientasi menjadi landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Setelah build pertama kali selesai, atur opasitas menjadi 1 dengan durasi animasi 2 detik
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke halaman menu surah saat gambar ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuSurah(),
                ),
              );
            },
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _opacityLevel,
                  child: Image.asset('assets/onboard1.png', width: 280),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50, // Ubah posisi tombol sedikit lebih atas
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman menu surah saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Learn Quran Apps Home Page'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffdbea8d),// Ubah warna tombol menjadi hijau
                ),
                child: Text(
                  'Start Now',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), // Ubah warna teks menjadi hitam
                    fontFamily: 'Roboto', // Set font menjadi Roboto
                    fontSize: 14, // Set ukuran font menjadi 14
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
  void dispose() {
    // Kembalikan preferensi orientasi ke default setelah halaman dihapus
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

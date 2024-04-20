import 'package:flutter/material.dart';
import 'package:pbl_v1/Databases/DbHelper.dart';
import 'package:pbl_v1/ButtonWidgets/AudioButton.dart';
import 'package:pbl_v1/ButtonWidgets/VideoButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class Annaas extends StatelessWidget {
  const Annaas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AnnaasState();
  }
}

class _AnnaasState extends StatefulWidget {
  @override
  __AnnaasState createState() => __AnnaasState();
}

class __AnnaasState extends State<_AnnaasState> {
  late final AssetsAudioPlayer audioPlayer;
  late List<String> audioPaths;
  bool isPlaying = false;
   
  // Function to get photos from database
  Future<List<String?>> getImagesFromDatabase(int idSurah) async {
    await DbHelper.copyDatabase('alquran1.db');
    Database database = await openDatabase('alquran1.db');

    List<Map> result = await database.rawQuery(
        'SELECT images FROM tbl_assets WHERE id_surah IN (?)',
        [idSurah]);

    List<String?> imageList =
        result.map((e) => e['images'] as String?).toList();

    // await database.close();
    return imageList;
  } 

  @override
  void initState() {
    super.initState();
    audioPlayer = AssetsAudioPlayer.newPlayer();
    audioPaths = [
      'assets/audio/annas/AYAT1.mp3',
      'assets/audio/annas/AYAT2.mp3',
      'assets/audio/annas/AYAT3.mp3',
      'assets/audio/annas/AYAT4.mp3',
      'assets/audio/annas/AYAT5.mp3',
      'assets/audio/annas/AYAT6.mp3',
    ];

    audioPlayer.current.listen((event) {
      setState(() {
        isPlaying = event != null && event.audio.assetAudioPath != null;
      });
    });
  }

  void playAudio(String path) async {
    await audioPlayer.open(
      Audio(path),
      showNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Contoh penggunaan untuk 10 database
    Future<List<String?>> imagesFromDatabase1 = getImagesFromDatabase(36);
    Future<List<String?>> imagesFromDatabase2 = getImagesFromDatabase(37);
    Future<List<String?>> imagesFromDatabase3 = getImagesFromDatabase(38);
    Future<List<String?>> imagesFromDatabase4 = getImagesFromDatabase(39);
    Future<List<String?>> imagesFromDatabase5 = getImagesFromDatabase(40);
    Future<List<String?>> imagesFromDatabase6 = getImagesFromDatabase(41);
    Future<List<String?>> imagesFromDatabase7 = getImagesFromDatabase(42);
    Future<List<String?>> imagesFromDatabase8 = getImagesFromDatabase(43);
    Future<List<String?>> imagesFromDatabase9 = getImagesFromDatabase(44);
    Future<List<String?>> imagesFromDatabase10 = getImagesFromDatabase(45);
    Future<List<String?>> imagesFromDatabase11 = getImagesFromDatabase(46);
    Future<List<String?>> imagesFromDatabase12= getImagesFromDatabase(47);
    Future<List<String?>> imagesFromDatabase13= getImagesFromDatabase(48);
    double baseWidth = 852;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // headerbarg8f (8:115)
                width: double.infinity,
                height: 100 * fem,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // navheader1Aw (8:116)
                      left: 29 * fem,
                      top: 40 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 794 * fem,
                          height: 52 * fem,
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
                      // tahap1qsalfatihah1fmH (8:117)
                      left: 85 * fem,
                      top: 57 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 186 * fem,
                          height: 20 * fem,
                          child: Text(
                            'An-Naas',
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
                      // moreZ5y (8:118)
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
              ),
              Container(
                      // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                    padding: EdgeInsets.fromLTRB(90 * fem, 25 * fem, 16 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                    width: 850 * fem,
                    height: 400 * fem,
                    child: FutureBuilder<List<String?>>(
                      future: imagesFromDatabase1,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final List<String?>? imageList = snapshot.data;
                          if (imageList != null && imageList.isNotEmpty) {
                            return Image.asset(
                              'assets/surah/annass/${imageList[0] ?? ''}',
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Container();
                          }
                        }
                        },
                      ),
                    ),
                    Container(
                      // contentimageWQX (8:131)
                     margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 55 * fem, 13 * fem),

                          width: 413 * fem,
                          height: 75 * fem,
                      child: FutureBuilder<List<String?>>(
    future: imagesFromDatabase2, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                    // Audiobtn Videobtn
                    Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(385 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Container(
                                  // playduotoneqr7 (8:112)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                  width: 18* fem,
                                  height: 18 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/playduotone.png',
                                    width: 18 * fem,
                                    height: 18 * fem,
                                  ),
                                ),
                                Container(
                                  // videoA7h (8:111)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Video',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.1918749128 * ffem / fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                   onTap: () {
                                    if (!isPlaying) {
                                      playAudio(audioPaths[0]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                    // soundmaxduotoneioR (8:137)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                    width: 20 * fem,
                                    height: 18 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/soundmaxduotone.png',
                                      width: 20 * fem,
                                      height: 18 * fem,
                                    ),
                                  ),
                                  Container(
                                    // audiopLf (8:136)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    child: Text(
                                      'Audio',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.1918749128 * ffem / fem,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),]
                      ),
                    ), //audio video btn end
                    Container(
                     padding: EdgeInsets.fromLTRB(10 * fem, 15 * fem, 16 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // contentimageqtK (21:385)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                          width: 725 * fem,
                          height: 345 * fem,
                    child:FutureBuilder<List<String?>>(
                        future: imagesFromDatabase3, // Mengambil gambar dari database untuk id 3
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        Container(
                          // contentimage1NNT (20:328)
                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 13 * fem),

                          width: 285 * fem,
                          height: 75 * fem,
                          child: FutureBuilder<List<String?>>(
                     future: imagesFromDatabase4,// Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        
                       Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(390 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Container(
                                  // playduotoneqr7 (8:112)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                  width: 18* fem,
                                  height: 18 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/playduotone.png',
                                    width: 18 * fem,
                                    height: 18 * fem,
                                  ),
                                ),
                                Container(
                                  // videoA7h (8:111)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Video',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.1918749128 * ffem / fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                   if (!isPlaying) {
                                      playAudio(audioPaths[1]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                    // soundmaxduotoneioR (8:137)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                    width: 20 * fem,
                                    height: 18 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/soundmaxduotone.png',
                                      width: 20 * fem,
                                      height: 18 * fem,
                                    ),
                                  ),
                                  Container(
                                    // audiopLf (8:136)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    child: Text(
                                      'Audio',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.1918749128 * ffem / fem,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),]
                      ),
                    ), //audio video btn 
              
                  Container(
                    // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                    padding: EdgeInsets.fromLTRB(3 * fem, 15 * fem, 5 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // contentimageqtK (21:385)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                          width: 730 * fem,
                          height: 350 * fem,
                          child: FutureBuilder<List<String?>>(
    future: imagesFromDatabase5, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        Container(
                          // contentimage1NNT (20:328)
                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 15 * fem, 13 * fem),

                          width: 413 * fem,
                          height: 75 * fem,
                          child: FutureBuilder<List<String?>>(
    future: imagesFromDatabase6, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        
                        Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(370 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // playduotoneWd5 (20:320)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                      width: 18 * fem,
                                      height: 18 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/playduotone.png',
                                        width: 18 * fem,
                                        height: 18 * fem,
                                      ),
                                    ),
                                    Container(
                                      // video2bR (20:319)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        'Video',
                                        style: GoogleFonts.roboto(
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
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                   if (!isPlaying) {
                                      playAudio(audioPaths[2]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                          // soundmaxduotonep1V (20:327)
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                          width: 20 * fem,
                                          height: 18 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/soundmaxduotone.png',
                                            width: 20 * fem,
                                            height: 18 * fem,
                                          ),
                                        ),
                                      
                                      Container(
                                        // audioKU3 (20:326)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'Audio',
                                          style: GoogleFonts.roboto(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                    padding: EdgeInsets.fromLTRB(2 * fem, 15 * fem, 16 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // contentimageqtK (21:385)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                          width: 725 * fem,
                          height: 345 * fem,
                          child: FutureBuilder<List<String?>>(
    future: imagesFromDatabase7, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        Container(
                          // contentimage1NNT (20:328)
                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 13 * fem),

                          width: 413 * fem,
                          height: 75 * fem,
                          child: FutureBuilder<List<String?>>(
   future: imagesFromDatabase8,// Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        
                        Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(360 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // playduotoneWd5 (20:320)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                      width: 18 * fem,
                                      height: 18 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/playduotone.png',
                                        width: 18 * fem,
                                        height: 18 * fem,
                                      ),
                                    ),
                                    Container(
                                      // video2bR (20:319)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        'Video',
                                        style: GoogleFonts.roboto(
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
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    if (!isPlaying) {
                                      playAudio(audioPaths[3]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                          // soundmaxduotonep1V (20:327)
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                          width: 20 * fem,
                                          height: 18 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/soundmaxduotone.png',
                                            width: 20 * fem,
                                            height: 18 * fem,
                                          ),
                                        ),
                                      Container(
                                        // audioKU3 (20:326)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'Audio',
                                          style: GoogleFonts.roboto(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                    padding: EdgeInsets.fromLTRB(2 * fem, 15 * fem, 16 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // contentimageqtK (21:385)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                          width: 725 * fem,
                          height: 345 * fem,
                         child: FutureBuilder<List<String?>>(
   future: imagesFromDatabase9,// Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        Container(
                          // contentimage1NNT (20:328)
                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 28 * fem, 13 * fem),

                          width: 413 * fem,
                          height: 70 * fem,
                          child: FutureBuilder<List<String?>>(
   future: imagesFromDatabase10,// Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        
                        Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(360 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // playduotoneWd5 (20:320)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                      width: 18 * fem,
                                      height: 18 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/playduotone.png',
                                        width: 18 * fem,
                                        height: 18 * fem,
                                      ),
                                    ),
                                    Container(
                                      // video2bR (20:319)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        'Video',
                                        style: GoogleFonts.roboto(
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
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    if (!isPlaying) {
                                      playAudio(audioPaths[4]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                          // soundmaxduotonep1V (20:327)
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                          width: 20 * fem,
                                          height: 18 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/soundmaxduotone.png',
                                            width: 20 * fem,
                                            height: 18 * fem,
                                          ),
                                        ),
                                      Container(
                                        // audioKU3 (20:326)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'Audio',
                                          style: GoogleFonts.roboto(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                    padding: EdgeInsets.fromLTRB(2 * fem, 15 * fem, 16 * fem, 5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // contentimageqtK (21:385)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                          width: 725 * fem,
                          height: 345 * fem,
                          child: FutureBuilder<List<String?>>(
   future: imagesFromDatabase11, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        Container(
                          // contentimage1NNT (20:328)
                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 13 * fem),

                          width: 315 * fem,
                          height: 70 * fem,
                         child: FutureBuilder<List<String?>>(
                        future: imagesFromDatabase12, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        },
                      ),
                    ),
                        
                        Container(
                          // actionbuttonh9q (20:315)
                          margin: EdgeInsets.fromLTRB(360 * fem, 0 * fem, 0 * fem, 33 * fem),
                          padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 54 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // videobuttonoyZ (20:316)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdbea8d),
                                  borderRadius: BorderRadius.circular(16 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // playduotoneWd5 (20:320)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                      width: 18 * fem,
                                      height: 18 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/playduotone.png',
                                        width: 18 * fem,
                                        height: 18 * fem,
                                      ),
                                    ),
                                    Container(
                                      // video2bR (20:319)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        'Video',
                                        style: GoogleFonts.roboto(
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
                                // frameaudiobutton9R9 (20:322)
                                width: 139 * fem,
                                height: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    if (!isPlaying) {
                                      playAudio(audioPaths[5]); // Memutar audio ayat pertama ketika tombol ditekan
                                    } else {
                                      audioPlayer.stop(); // Menghentikan audio ketika tombol ditekan saat sedang diputar
                                    }
                                  },
                                  child: Container(
                                    // audiobuttonVju (20:323)
                                    padding: EdgeInsets.fromLTRB(21 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                          // soundmaxduotonep1V (20:327)
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                          width: 20 * fem,
                                          height: 18 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/soundmaxduotone.png',
                                            width: 20 * fem,
                                            height: 18 * fem,
                                          ),
                                        ),
                                      Container(
                                        // audioKU3 (20:326)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'Audio',
                                          style: GoogleFonts.roboto(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
              margin: EdgeInsets.fromLTRB(0* fem, 0 * fem, 60* fem, 0 * fem),
              width: 703 * fem,
              height: 531 * fem,
              child: FutureBuilder<List<String?>>(
    future: imagesFromDatabase13, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/annass/${imageList[0] ?? ''}',
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Container(); // Tidak ada gambar
                            }
                          }
                        }
                      )
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ]
     ),
    )
    )
   );
  }
}
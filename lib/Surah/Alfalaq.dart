import 'package:flutter/material.dart';
import 'package:pbl_v1/Databases/DbHelper.dart';
import 'package:pbl_v1/ButtonWidgets/AudioButton.dart';
import 'package:pbl_v1/ButtonWidgets/VideoButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';

class Alfalaq extends StatelessWidget {
  const Alfalaq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AlfalaqState();
  }
}

class _AlfalaqState extends StatefulWidget {
  @override
  __AlfalaqState createState() => __AlfalaqState();
}

class __AlfalaqState extends State<_AlfalaqState> {
  late final AssetsAudioPlayer audioPlayer;
  late List<String> audioPaths;
  Map<String, bool> isPlayingMap = {};
  String? currentPlayingAudioPath;
   
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
      'AYAT1.mp3',
      'AYAT2.mp3',
      'AYAT3.mp3',
      'AYAT4.mp3',
      'AYAT5.mp3',
    ];

   audioPlayer.current.listen((event) {
      if (event != null && event.audio.assetAudioPath != null) {
        setState(() {
          isPlayingMap[currentPlayingAudioPath!] = true;
        });
      } else {
        setState(() {
          isPlayingMap[currentPlayingAudioPath!] = false;
        });
      }
    });
  }

  void playAudio(String audioPath) {
    if (!isPlayingMap.containsKey(audioPath) || !isPlayingMap[audioPath]!) {
      if (currentPlayingAudioPath != null &&
          isPlayingMap.containsKey(currentPlayingAudioPath!) &&
          isPlayingMap[currentPlayingAudioPath!]!) {
        stopAudio(currentPlayingAudioPath!);
      }
      audioPlayer.open(Audio('assets/audio/alfalaq/$audioPath'));
      setState(() {
        currentPlayingAudioPath = audioPath;
        isPlayingMap[currentPlayingAudioPath!] = true;
      });
    } else {
      stopAudio(audioPath);
    }
  }

  void stopAudio(String audioPath) {
    audioPlayer.stop();
    setState(() {
      isPlayingMap[audioPath] = false;
      currentPlayingAudioPath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<String?>> imagesFromDatabase1 = getImagesFromDatabase(25);
    Future<List<String?>> imagesFromDatabase2 = getImagesFromDatabase(26);
    Future<List<String?>> imagesFromDatabase3 = getImagesFromDatabase(27);
    Future<List<String?>> imagesFromDatabase4 = getImagesFromDatabase(28);
    Future<List<String?>> imagesFromDatabase5 = getImagesFromDatabase(29);
    Future<List<String?>> imagesFromDatabase6 = getImagesFromDatabase(30);
    Future<List<String?>> imagesFromDatabase7 = getImagesFromDatabase(31);
    Future<List<String?>> imagesFromDatabase8 = getImagesFromDatabase(32);
    Future<List<String?>> imagesFromDatabase9 = getImagesFromDatabase(33);
    Future<List<String?>> imagesFromDatabase10 = getImagesFromDatabase(34);

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
              // width: double.infinity,
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
                          'Al - Falaq',
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
              padding:
                    EdgeInsets.fromLTRB(90 * fem, 25 * fem, 16 * fem, 5 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26 * fem, 10 * fem),
                      width: 734 * fem,
                      height: 264 * fem,
                      child: FutureBuilder<List<String?>>(
                        future: imagesFromDatabase1,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 20 * fem, 13 * fem),

                      width: 361 * fem,
                      height: 73 * fem,
                      child: FutureBuilder<List<String?>>(
                        future:
              imagesFromDatabase2, // Mengambil gambar dari database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Jika sedang loading, tampilkan widget loading
                            return Container();
                          } else if (snapshot.hasError) {
                            // Jika terjadi error, tampilkan pesan error
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Jika sukses mengambil gambar, tampilkan gambar
                            final List<String?>? imageList = snapshot.data;
                            if (imageList != null && imageList.isNotEmpty) {
                              return Image.asset(
                                'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                      margin: EdgeInsets.fromLTRB(
                          395 * fem, 0 * fem, 0 * fem, 33 * fem),
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      height: 54 * fem,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // videobuttonoyZ (20:316)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 25 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  22 * fem, 17 * fem, 45 * fem, 18 * fem),
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
                                    width: 18 * fem,
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
                                  playAudio('AYAT1.mp3');
                                },
                                child: Container(
                                  // audiobuttonVju (20:323)
                                  padding: EdgeInsets.fromLTRB(
                                      21 * fem, 17 * fem, 45 * fem, 18 * fem),
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbea8d),
                                    borderRadius:
                                        BorderRadius.circular(16 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // soundmaxduotoneioR (8:137)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 16 * fem, 0 * fem),
                                        width: 20 * fem,
                                        height: 18 * fem,
                                        child: Image.asset(
                                        isPlayingMap.containsKey('AYAT1.mp3') &&
                                                  isPlayingMap['AYAT1.mp3']!
                                              ? 'assets/page-1/images/soundmaxduotone.png'
                                              : 'assets/page-1/images/soundmaxduotone.png',
                                          width: 20 * fem,
                                          height: 18 * fem,
                                        ),
                                      ),
                                      Container(
                                        // audiopLf (8:136)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                           isPlayingMap.containsKey('AYAT1.mp3') &&
                                                  isPlayingMap['AYAT1.mp3']!
                                              ? 'Stop'
                                              : 'Audio',
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
                            ),
                          ]),
                    ), 
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 15 * fem, 16 * fem, 5 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // contentimageqtK (21:385)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 26 * fem, 10 * fem),
                            width: 695 * fem,
                            height: 319 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                        imagesFromDatabase3, // Mengambil gambar dari database untuk id 3
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 25 * fem, 13 * fem),

                            width: 286 * fem,
                            height: 70 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                                  imagesFromDatabase4, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                380 * fem, 0 * fem, 0 * fem, 33 * fem),
                            padding: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 54 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // videobuttonoyZ (20:316)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbea8d),
                                    borderRadius:
                                        BorderRadius.circular(16 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // playduotoneWd5 (20:320)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 17 * fem, 0 * fem),
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
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
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
                                  playAudio('AYAT2.mp3');
                                },
                                    child: Container(
                                      // audiobuttonVju (20:323)
                                      padding: EdgeInsets.fromLTRB(21 * fem,
                                          17 * fem, 45 * fem, 18 * fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdbea8d),
                                        borderRadius:
                                            BorderRadius.circular(16 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // soundmaxduotonep1V (20:327)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 16 * fem, 0 * fem),
                                            width: 20 * fem,
                                            height: 18 * fem,
                                            child: Image.asset(
                                              isPlayingMap.containsKey('AYAT2.mp3') &&
                                                  isPlayingMap['AYAT2.mp3']!
                                              ? 'assets/page-1/images/soundmaxduotone.png'
                                              : 'assets/page-1/images/soundmaxduotone.png',
                                              width: 20 * fem,
                                              height: 18 * fem,
                                            ),
                                          ),
                                          Container(
                                            // audioKU3 (20:326)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                1 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                                 isPlayingMap.containsKey('AYAT2.mp3') &&
                                                  isPlayingMap['AYAT2.mp3']!
                                              ? 'Stop'
                                              : 'Audio',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height:
                                                    1.1918749128 * ffem / fem,
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
                    ),//audio video btn end
                    Container(
                      // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 15 * fem, 15 * fem, 5 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // contentimageqtK (21:385)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 26 * fem, 10 * fem),
                            width: 700 * fem,
                            height: 320 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                                  imagesFromDatabase5, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 18 * fem, 13 * fem),

                            width: 413 * fem,
                            height: 75 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                        imagesFromDatabase6, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                380 * fem, 0 * fem, 13 * fem, 33 * fem),
                            padding: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 54 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // videobuttonoyZ (20:316)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbea8d),
                                    borderRadius:
                                        BorderRadius.circular(16 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // playduotoneWd5 (20:320)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 17 * fem, 0 * fem),
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
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
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
                                  playAudio('AYAT3.mp3');
                                },
                                    child: Container(
                                      // audiobuttonVju (20:323)
                                      padding: EdgeInsets.fromLTRB(21 * fem,
                                          17 * fem, 45 * fem, 18 * fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdbea8d),
                                        borderRadius:
                                            BorderRadius.circular(16 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // soundmaxduotonep1V (20:327)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 16 * fem, 0 * fem),
                                            width: 20 * fem,
                                            height: 18 * fem,
                                            child: Image.asset(
                                               isPlayingMap.containsKey('AYAT3.mp3') &&
                                                  isPlayingMap['AYAT3.mp3']!
                                              ? 'assets/page-1/images/soundmaxduotone.png'
                                              : 'assets/page-1/images/soundmaxduotone.png',
                                              width: 20 * fem,
                                              height: 18 * fem,
                                            ),
                                          ),
                                          Container(
                                            // audioKU3 (20:326)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                1 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                              isPlayingMap.containsKey('AYAT3.mp3') &&
                                                  isPlayingMap['AYAT3.mp3']!
                                              ? 'Stop'
                                              : 'Audio',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height:
                                                    1.1918749128 * ffem / fem,
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
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 15 * fem, 16 * fem, 5 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // contentimageqtK (21:385)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 26 * fem, 10 * fem),
                            width: 720 * fem,
                            height: 320 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                        imagesFromDatabase7, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 15 * fem, 13 * fem),

                            width: 413 * fem,
                            height: 75 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                                  imagesFromDatabase8, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                375 * fem, 0 * fem, 20 * fem, 33 * fem),
                            padding: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 54 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // videobuttonoyZ (20:316)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbea8d),
                                    borderRadius:
                                        BorderRadius.circular(16 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // playduotoneWd5 (20:320)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 17 * fem, 0 * fem),
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
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
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
                                  playAudio('AYAT4.mp3');
                                },
                                  child: Container(
                                      // audiobuttonVju (20:323)
                                      padding: EdgeInsets.fromLTRB(21 * fem,
                                          17 * fem, 45 * fem, 18 * fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdbea8d),
                                        borderRadius:
                                            BorderRadius.circular(16 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // soundmaxduotonep1V (20:327)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 16 * fem, 0 * fem),
                                            width: 20 * fem,
                                            height: 18 * fem,
                                            child: Image.asset(
                                              isPlayingMap.containsKey('AYAT4.mp3') &&
                                                  isPlayingMap['AYAT4.mp3']!
                                              ? 'assets/page-1/images/soundmaxduotone.png'
                                              : 'assets/page-1/images/soundmaxduotone.png',
                                              width: 20 * fem,
                                              height: 18 * fem,
                                            ),
                                          ),
                                          Container(
                                            // audioKU3 (20:326)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                1 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                                 isPlayingMap.containsKey('AYAT4.mp3') &&
                                                  isPlayingMap['AYAT4.mp3']!
                                              ? 'Stop'
                                              : 'Audio',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height:
                                                    1.1918749128 * ffem / fem,
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
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 15 * fem, 16 * fem, 5 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // contentimageqtK (21:385)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 26 * fem, 10 * fem),
                            width: 710 * fem,
                            height: 318.5 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                        imagesFromDatabase9, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 18 * fem, 13 * fem),

                            width: 413 * fem,
                            height: 75 * fem,
                            child: FutureBuilder<List<String?>>(
                              future:
                      imagesFromDatabase10, // Mengambil gambar dari database
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Jika sedang loading, tampilkan widget loading
                                  return Container();
                                } else if (snapshot.hasError) {
                                  // Jika terjadi error, tampilkan pesan error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Jika sukses mengambil gambar, tampilkan gambar
                                  final List<String?>? imageList =
                                      snapshot.data;
                                  if (imageList != null &&
                                      imageList.isNotEmpty) {
                                    return Image.asset(
                                      'assets/surah/alfalaq/${imageList[0] ?? ''}',
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
                            margin: EdgeInsets.fromLTRB(
                                370 * fem, 0 * fem, 0 * fem, 28 * fem),
                            padding: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 54 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // videobuttonoyZ (20:316)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      22 * fem, 17 * fem, 45 * fem, 18 * fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffdbea8d),
                                    borderRadius:
                                        BorderRadius.circular(16 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // playduotoneWd5 (20:320)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 17 * fem, 0 * fem),
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
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
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
                                  playAudio('AYAT5.mp3');
                                },
                                  child: Container(
                                      // audiobuttonVju (20:323)
                                      padding: EdgeInsets.fromLTRB(21 * fem,
                                          17 * fem, 45 * fem, 18 * fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdbea8d),
                                        borderRadius:
                                            BorderRadius.circular(16 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // soundmaxduotonep1V (20:327)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 16 * fem, 0 * fem),
                                            width: 20 * fem,
                                            height: 18 * fem,
                                            child: Image.asset(
                                             isPlayingMap.containsKey('AYAT5.mp3') &&
                                                  isPlayingMap['AYAT5.mp3']!
                                              ? 'assets/page-1/images/soundmaxduotone.png'
                                              : 'assets/page-1/images/soundmaxduotone.png',
                                              width: 20 * fem,
                                              height: 18 * fem,
                                            ),
                                          ),
                                          Container(
                                            // audioKU3 (20:326)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                1 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                                isPlayingMap.containsKey('AYAT5.mp3') &&
                                                  isPlayingMap['AYAT5.mp3']!
                                              ? 'Stop'
                                              : 'Audio',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height:
                                                    1.1918749128 * ffem / fem,
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
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 60 * fem, 0 * fem),
                      width: 703 * fem,
                      height: 531 * fem,
                      child: Image.asset(
                        'assets/surah/alfalaq/tajwid.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );}
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }}
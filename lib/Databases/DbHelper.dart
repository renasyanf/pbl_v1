import 'dart:async';
import 'dart:io';
// Tambahkan impor ini
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<void> copyDatabase(String dbName) async {
    ByteData data = await rootBundle.load("assets/$dbName");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Mendapatkan path untuk penyimpanan database di perangkat
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, dbName);

    // Menulis data bytes ke path yang ditentukan
    await File(dbPath).writeAsBytes(bytes);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Menyalin database dari aset ke penyimpanan lokal perangkat
  await DbHelper.copyDatabase('alquran1.db');

  // Membuka database
  Database database = await openDatabase('alquran1.db');

  // Lakukan operasi database...
  // Contoh:
  // await database.rawQuery('SELECT * FROM table_name');

  // Tutup database ketika selesai
  await database.close();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Quran App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Darjah1Screen(),
    );
  }
}

class Darjah1Screen extends StatelessWidget {
  const Darjah1Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 68,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // navheader1Aw (8:116)
                      left: 29,
                      top: 16,
                      child: Align(
                        child: SizedBox(
                          width: 794,
                          height: 52,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xffdbea8d),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ...Widget lainnya di sini
                  ],
                ),
              ),
              Container(
                // autogroupsgpzyvP (56896Yzyh1G6wME5YUsGPZ)
                padding: const EdgeInsets.fromLTRB(103, 22, 26, 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // contentimageWQX (8:131)
                      margin: const EdgeInsets.fromLTRB(0, 0, 3, 22),
                      width: 720,
                      height: 126,
                      // Widget FutureBuilder untuk menampilkan gambar dari database
                    ),
                    // ...Widget lainnya di sini
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

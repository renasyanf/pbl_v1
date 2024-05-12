import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late Map<String, dynamic> _quranData;

  @override
  void initState() {
    super.initState();
    _loadQuranData();
  }

  Future<void> _loadQuranData() async {
    try {
      String data = await rootBundle.loadString('assets/data.json');
      setState(() {
        _quranData = jsonDecode(data);
      });
    } catch (e) {
      print('Error loading Quran data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quranic Verses'),
      ),
      body: _quranData != null
          ? ListView.builder(
              itemCount: _quranData.length,
              itemBuilder: (context, index) {
                var surah = _quranData[(index + 1).toString()];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Surah ${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: surah.length,
                      itemBuilder: (context, idx) {
                        var verse = surah[(idx + 1).toString()];
                        return ListTile(
                          title: Text(verse['displayText']),
                          subtitle: Text(verse['text']),
                        );
                      },
                    ),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  String _recitationStatus = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Color(0xffdbea8d),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _listen,
        child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        backgroundColor: Color(0xffdbea8d),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Column(
            children: [
              Text(
                _text,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Amiri',
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 20),
              Text(
                _recitationStatus,
                style: TextStyle(
                  fontSize: 18.0,
                  color: _recitationStatus.contains('Correct') ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          _recitationStatus = '';
        });
        _speech.listen(
          onResult: (val) async {
            setState(() {
              _text = val.recognizedWords;
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            });
            String correctedText = await correctText(_text);
            setState(() {
              _recitationStatus = _text == correctedText ? 'Correct Reading' : 'Incorrect Reading';
            });
          },
          localeId: 'ar',
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  Future<String> correctText(String text) async {
    List<String> verses = await fetchQuranText();
    String correctedText = text;
    for (String verse in verses) {
      if (text.contains(verse)) {
        correctedText = text.replaceAll(verse, '');
        break;
      }
    }
    return correctedText;
  }

  Future<List<String>> fetchQuranText() async {
    try {
      String data = await rootBundle.loadString('assets/data.json');
      Map<String, dynamic> surahs = jsonDecode(data);
      List<String> allVerses = [];

      surahs.forEach((surahKey, surahValue) {
        surahValue.forEach((ayahKey, ayahValue) {
          allVerses.add(ayahValue['text']);
        });
      });

      return allVerses;
    } catch (e) {
      print('Error loading Quranic verses: $e');
      return [];
    }
  }
}

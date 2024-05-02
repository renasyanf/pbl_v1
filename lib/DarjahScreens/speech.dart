import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
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
  String _recitationStatus = ''; // Adding a new variable for recitation status

  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
    'example': HighlightedWord(
      onTap: () => print('example'),
      textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
  };

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
              TextHighlight(
                text: _text,
                words: _highlights,
                textStyle: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Amiri',
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 20),
              Text(
                _recitationStatus, // Display recitation status
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
          _recitationStatus = ''; // Clear previous status when starting to listen
        });
        _speech.listen(
          onResult: (val) async {
            setState(() {
              _text = val.recognizedWords;
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            });
            String quranText = await fetchQuranText();
            bool isCorrect = rabinKarp(_text, quranText);
            setState(() {
              _recitationStatus = isCorrect ? 'Correct Reading' : 'Incorrect Reading';
            });
          },
          localeId: 'ar', // Use Arabic locale
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  Future<String> fetchQuranText() async {
    var url = Uri.parse('http://api.alquran.cloud/v1/quran/en.asad');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['data']['surahs'][0]['ayahs'][0]['text']; // Simplification: returning first verse
    } else {
      throw Exception('Failed to load Quran text');
    }
  }

  bool rabinKarp(String pattern, String text) {
    int prime = 101; // A prime number
    int m = pattern.length;
    int n = text.length;
    int i, j;
    int patternHash = 0;
    int textHash = 0;
    int h = 1;

    for (i = 0; i < m - 1; i++)
      h = (h * 256) % prime;

    for (i = 0; i < m; i++) {
      patternHash = (256 * patternHash + pattern.codeUnitAt(i)) % prime;
      textHash = (256 * textHash + text.codeUnitAt(i)) % prime;
    }

    for (i = 0; i <= n - m; i++) {
      if (patternHash == textHash) {
        for (j = 0; j < m; j++) {
          if (text[i + j] != pattern[j])
            break;
        }
        if (j == m)
          return true;
      }
      if (i < n - m) {
        textHash = (256 * (textHash - text.codeUnitAt(i) * h) + text.codeUnitAt(i + m)) % prime;
        if (textHash < 0)
          textHash = (textHash + prime);
      }
    }
    return false;
  }
}
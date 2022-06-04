// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../constants.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  final sugerenciaController = TextEditingController();
  late stt.SpeechToText _speech;

  bool escuchando = false;
  String _text = 'Transcripcion';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF0D0D17),
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
            // color: const Color(0xFF14141E),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: _text,
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prediccion',
                enabled: false,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: escuchando ? Colors.red : colorPrimario,
              ),
              onPressed: _listen,
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'ESCUCHAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> reproducirPalabra(String palabra) async {
    FlutterTts flutterTts = FlutterTts();
    var result = await flutterTts.speak(palabra);
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("es-MX");

    await flutterTts.setSpeechRate(0.3);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(0.5);

    await flutterTts.isLanguageAvailable("es-MX");
  }

  void _listen() async {
    if (!escuchando) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => escuchando = false);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            reproducirPalabra(_text);
          }),
        );
      }
    }
  }

  void _stopListen() async {
    setState(() => escuchando = false);
    _speech.stop();
  }
}

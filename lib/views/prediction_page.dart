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
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: _text,
                enabled: false,
              ),
            ),
            Text(
              '00:00:00',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 50,
                fontWeight: FontWeight.w900,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    label: Text(
                      'INICIAR',
                      style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
                    ),
                    icon: Icon(Icons.play_circle, size: 25),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(140, 40),
                      primary: Color.fromARGB(255, 7, 92, 11),
                    ),
                    onPressed: () {
                      _listen();
                    },
                  ),
                  ElevatedButton.icon(
                    label: Text(
                      'DETENER',
                      style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
                    ),
                    icon: Icon(Icons.stop_circle, size: 25),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(140, 40),
                      primary: Color.fromARGB(255, 92, 7, 7),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> reproducirPalabra(String palabra) async {
    print(palabra);
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

            final splitted = _text.split(' ');
            reproducirPalabra(splitted[splitted.length - 1]);
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

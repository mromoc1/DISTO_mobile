// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_final_fields, unused_local_variable, avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  // //PROBANDO PAITON
  // Python pythonScript = Python();
  // String pythonCodeResult = "";
  // //PROBANDO PAITON
  final sugerenciaController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Transcripcion';
  String _textPrediction = 'Prediccion';

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
            SizedBox(height: 10),
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
                labelText: _textPrediction,
                enabled: false,
              ),
            ),
            SizedBox(height: 10),
            IconButton(
              onPressed: _listen,
              icon: Icon(
                  _isListening ? Icons.stop_rounded : Icons.play_arrow_rounded),
              iconSize: 70,
              color: _isListening
                  ? Color.fromARGB(255, 103, 36, 36)
                  : Color(0xFF243B67),
            ),
            // //PROBANDO PAITON
            // TextButton(
            //   child: const Text("Execute python code"),
            //   onPressed: () async {
            //     await pythonScript.execute('lib/holaMundo.py').then((result) {
            //       setState(() {
            //         pythonCodeResult = result;
            //       });
            //     });
            //   },
            // ),
            // Text(pythonCodeResult),
            // //PROBANDO PAITON
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
    final socket = await Socket.connect('15.228.98.225', 9999);
    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        print('Server: $serverResponse');
        _textPrediction = serverResponse;
      },
      onDone: () {
        print('Server left.');
        socket.destroy();
      },
    );
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            final splitted = _text.split(' ');
            _text = splitted.last;
            print(_text); //text esta repitiendo
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      socket.write(_text);
      _speech.stop();
    }
  }
}

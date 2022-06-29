// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:python/python.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:app/API.dart';
import 'dart:io';
import 'dart:typed_data';

import '../constants.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  @override
  void initState() {
    super.initState();
    _initSpeech();
    //solicitud();
  }

  SpeechToText _speechToText = SpeechToText();
  final sugerenciaController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _speechEnabled = false;
  String _lastWords = '';
  String url = "";
  String texto = "";
  //final socket = null;
  var Data;
  //String QueryText = 'Prediccion';

  bool escuchando = false;
  bool _isListening = false;
  String _text = 'Transcripcion';

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
                labelText: _speechToText.isListening
                    ? '$_lastWords'
                    // If listening isn't active but could be tell the user
                    // how to start it, otherwise indicate that speech
                    // recognition is not yet ready or not supported on
                    // the target device
                    : _speechEnabled
                        ? 'Tap the microphone to start listening...'
                        : 'Speech not available',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: escuchando ? Colors.red : colorPrimario,
              ),
              onPressed: _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'ESCUCHAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: escuchando ? Colors.red : colorPrimario,
              ),
              onPressed: ayuda,
              icon: Icon(escuchando ? Icons.stop : Icons.help, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'AYUDA',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void ayuda() async {
    setState(() {
      solicitud(texto);
    });
  }

  Future<void> reproducirPalabra(String palabra) async {
    print(palabra);
    FlutterTts flutterTts = FlutterTts();
    var result = await flutterTts.speak(palabra);
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("es-MX");
    await flutterTts.setSpeechRate(0.1);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.5);
    await flutterTts.isLanguageAvailable("es-MX");
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      texto = '' + _lastWords;

      // url = 'http://127.0.0.1:5000/api?Query=' + _lastWords;
      // Data = GetData(url);
      //var DecodedData = jsonDecode(Data);
      //print(DecodedData);
      //QueryText = DecodedData['Query'];
    });
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void solicitud(String texto) async {
    final socket = await Socket.connect('15.228.98.225', 9999);
    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        print('Server: $serverResponse');
        reproducirPalabra(serverResponse);

        // _textPrediction = serverResponse;
      },
      onDone: () {
        print('Server left.');
        socket.destroy();
      },
    );
    socket.write(texto);
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    //final socket = await Socket.connect('15.228.98.225', 9999);
    await _speechToText.stop();
    setState(() {
      //solicitud(texto);
    });
  }

  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val'),
  //     );
  //     if (available) {
  //       setState(() => _isListening = true);
  //       _speech.listen(
  //         onResult: (val) => setState(() {
  //           _text = val.recognizedWords;
  //           // print('TEXTO A IMPRIMIR' + _text);
  //           final splitted = _text.split(' ');
  //           // print('PALABRA A SOLICITAR PARA REPRODUCCION' +
  //           //     splitted[splitted.length - 1]);
  //           // //url = 'http://127.0.0.1:5000/api?Query=' +
  //           //     splitted[splitted.length - 1];
  //           // //Data = await GetData(url);
  //           // //var DecodedData = jsonDecode(Data);
  //           // //print(DecodedData);
  //           // //QueryText = DecodedData['Query'];

  //           //reproducirPalabra(splitted[splitted.length - 1]);
  //           reproducirPalabra(splitted[splitted.length - 1]);
  //           _text = splitted.last;
  //           print(_text); //text esta repitiendo
  //         }),
  //       );
  //     }
  //   } else {
  //     setState(() => _isListening = false);
  //     _speech.stop();
  //   }
  // }
}

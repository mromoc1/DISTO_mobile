// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_final_fields, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
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
  }

  SpeechToText _speechToText = SpeechToText();
  final sugerenciaController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _speechEnabled = false;
  String _lastWords = '';

  String texto = "";
  String _text = 'Prediccion del Sistema';

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              'Sugerencia',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Bevan',
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: _text,
                enabled: false,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabled: false,
                border: OutlineInputBorder(),
                labelText: _speechToText.isListening
                    ? '$_lastWords'
                    : _speechEnabled
                        ? 'Tap the microphone to start listening...'
                        : 'Speech not available',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: colorPrimario,
              ),
              onPressed: _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
              icon: Icon(Icons.mic_sharp, size: 30),
              label: Text('ESCUCHAR', style: fuente_montserrat_15),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: colorPrimario,
              ),
              onPressed: ayuda,
              icon: Icon(Icons.help, size: 30),
              label: Text('AYUDA', style: fuente_montserrat_15),
            ),
            const SizedBox(height: 25),
            Text(
              'Configuracion',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Bevan',
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Volumen de la sugerencia: ',
                    style: fuente_montserrat_diagonal_18,
                  ),
                  Slider(
                    value: volumen,
                    min: 0,
                    max: 1,
                    divisions: 10,
                    thumbColor: colorPrimario,
                    activeColor: colorPrimario,
                    label: "$volumen",
                    onChanged: (value) {
                      setState(() => volumen = value);
                    },
                  ),
                  Text(
                    'Velocidad de la sugerencia: ',
                    style: fuente_montserrat_diagonal_18,
                  ),
                  Slider(
                    value: velocidad,
                    min: 0.5,
                    max: 1,
                    divisions: 5,
                    label: "$velocidad",
                    thumbColor: colorPrimario,
                    activeColor: colorPrimario,
                    onChanged: (value) {
                      setState(() => velocidad = value);
                    },
                  ),
                  Text(
                    'Tono de la sugerencia: ',
                    style: fuente_montserrat_diagonal_18,
                  ),
                  Slider(
                    value: tono,
                    min: 0.5,
                    max: 2,
                    divisions: 15,
                    label: "$tono",
                    thumbColor: colorPrimario,
                    activeColor: colorPrimario,
                    onChanged: (value) {
                      setState(() => tono = value);
                    },
                  ),
                ],
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
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage("es-MX");
    flutterTts.setSpeechRate(velocidad);
    flutterTts.setVolume(volumen);
    flutterTts.setPitch(tono);
    flutterTts.isLanguageAvailable("es-MX");

    var result = await flutterTts.speak(palabra);
    List<dynamic> languages = await flutterTts.getLanguages;
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
    final socket = await Socket.connect('54.232.247.4', 9999);
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

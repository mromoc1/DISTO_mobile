// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_final_fields, unused_local_variable

import 'dart:io';

import 'package:app/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:python/python.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../constants.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  final sugerenciaController = TextEditingController();
  late stt.SpeechToText _speech;
<<<<<<< HEAD
  String url = "";
  var Data;
  String QueryText = 'Prediccion';

  bool escuchando = false;
=======
  bool _isListening = false;
>>>>>>> 4ade504e25a464a486a2b7cd7736102151087ee7
  String _text = 'Transcripcion';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Widget build(BuildContext context) {
    //Python pythonScript = Python();
    //String pythonCodeResult = "";
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
                labelText: QueryText,
                enabled: false,
              ),
            ),
<<<<<<< HEAD
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                primary: escuchando ? Colors.red : colorPrimario,
              ),
              onPressed: _listen,
              // onPressed: () async {
              //bool exists = await Directory('lib/holaMundo.py').exists();
              //Directory appDocDir = await getApplicationDocumentsDirectory();
              //print('Ruta final:' + appDocDir.path);
              //bool exists = pythonScript.fileExists('python/holaMundo.py');
              //print(exists);
              // await pythonScript
              //     .execute('python/holaMundo.py')
              //     .then((result) {
              //   setState(() {
              //     pythonCodeResult = result;
              //   });
              // });
              // },
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'ESCUCHAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
=======
            SizedBox(height: 10),
            IconButton(
              onPressed: _listen, 
              icon: Icon(_isListening ? Icons.stop_rounded : Icons.play_arrow_rounded),
              iconSize: 70,
              color: _isListening ? Color.fromARGB(255, 103, 36, 36) : Color(0xFF243B67) ,
            )
>>>>>>> 4ade504e25a464a486a2b7cd7736102151087ee7
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
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() async {
            _text = "";
            _text = val.recognizedWords;
            print('TEXTO A IMPRIMIR' + _text);
            final splitted = _text.split(' ');
<<<<<<< HEAD
            print('PALABRA A SOLICITAR PARA REPRODUCCION' +
                splitted[splitted.length - 1]);
            url = 'http://127.0.0.1:5000/api?Query=' +
                splitted[splitted.length - 1];
            Data = await GetData(url);
            var DecodedData = jsonDecode(Data);
            print(DecodedData);
            QueryText = DecodedData['Query'];

            //reproducirPalabra(splitted[splitted.length - 1]);
            reproducirPalabra(QueryText);
=======
            _text = splitted.last;
            print(_text); //text esta repitiendo
>>>>>>> 4ade504e25a464a486a2b7cd7736102151087ee7
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

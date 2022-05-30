import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  bool escuchando = false;
  String _text = 'PALABRA TRANSCRITA';

  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
            const SizedBox(height: 10),
            const Text(
              'GENERACION DE SUGERENCIA',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontFamily: 'Dosis'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  enabled: true,
                  filled: true,
                  labelText: 'TRANSCRIPCION DEL SISTEMA',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  enabled: true,
                  filled: true,
                  labelText: 'SUGERENCIA DEL SISTEMA',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 50),
                  primary: escuchando ? Colors.red : Color(0xFF476BF6),
                  onPrimary: Colors.black),
              onPressed: () {},
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'INICIAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

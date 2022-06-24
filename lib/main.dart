// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'constants.dart';
import 'views/book_page.dart';
import 'views/home_page.dart';
import 'views/prediction_page.dart';
import 'API.dart';

void main() => runApp(const rmiApp());

class rmiApp extends StatelessWidget {
  const rmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DISTO",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  final paginas = [
    HomePage(),
    PredictionPage(),
    BookPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimario,
        title: Center(
          child: Text(
            ' DISTO ',
            style: TextStyle(
                fontSize: 30, color: colorTexto1, fontFamily: 'Bungee'),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 40,
            color: colorSecundario,
          ),
          Icon(
            Icons.mic,
            size: 40,
            color: colorSecundario,
          ),
          Icon(
            Icons.book,
            size: 40,
            color: colorSecundario,
          ),
        ],
        color: colorPrimario,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: paginas[_page],
    );
  }
}

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'views/book_page.dart';
import 'views/home_page.dart';
import 'views/prediction_page.dart';

void main() => runApp(const rmiApp());

class rmiApp extends StatelessWidget {
  const rmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "clienteRMI",
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
        backgroundColor: const Color(0xFF476BF6),
        title: Center(
          child: Text(
            ' DISTO ',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontFamily: 'Bungee'),
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
          ),
          Icon(
            Icons.mic,
            size: 40,
          ),
          Icon(
            Icons.book,
            size: 40,
          ),
        ],
        color: const Color(0xFF476BF6),
        buttonBackgroundColor: const Color(0xFF476BF6),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
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

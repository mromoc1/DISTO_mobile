import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF0D0D17),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: const Color(0xFF14141E),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'BOOK',
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Dosis'),
            )),
      ));
}

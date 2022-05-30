import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          // backgroundColor: const Color(0xFF0D0D17),
          body: Center(
        child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                // color: const Color(0xFF14141E),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                const Text(
                  'HOME',
                  style: TextStyle(fontSize: 20, fontFamily: 'Dosis'),
                ),
                const SizedBox(height: 10),
              ],
            )),
      ));
}

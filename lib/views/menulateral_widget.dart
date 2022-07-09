import 'dart:ui';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: colorPrimario,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            CrearMenu(
              text: 'Acerca de',
              icon: Icons.people,
            ),
          ],
        ),
      ),
    );
  }
}

Widget CrearMenu({required String text, required IconData icon}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: () {},
  );
}

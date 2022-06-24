// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Buscar...',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                DataTable(columns: [
                  DataColumn(
                    label: Text('PALABRAS ALMACENADAS',
                        style: TextStyle(fontSize: 16, fontFamily: 'Dosis')),
                  ),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Palabra 1',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 2',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 3',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 4',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 5',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 6',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 7',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 8',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 9',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 10',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 11',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 12',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 13',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 14',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 15',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 16',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 16',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 17',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 18',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 19',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 20',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 21',
                        style: TextStyle(fontSize: 14, fontFamily: 'Dosis')))
                  ]),
                ])
              ],
            )),
      ));
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/database/palabras.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookState();
}

class _BookState extends State<BookPage> {
  List<Palabra> Lp = [];

  // cargarPalabras() async {
  //   List<Palabra> auxLp = await DB.obtenerPalabras();
  //   setState(() {
  //     Lp = auxLp;
  //   });
  // }

  // @override
  // void initState() {
  //   cargarPalabras();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Color.fromARGB(255, 45, 17, 170),
                      ),
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Color.fromARGB(255, 173, 12, 0),
                      ),
                      iconSize: 35,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DataTable(columns: [
                  DataColumn(
                    label: Text('PALABRAS PROBLEMATICAS',
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
      ),
    );
  }
}

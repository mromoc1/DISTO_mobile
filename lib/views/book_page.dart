// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:app/database/palabras.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookState();
}

class _BookState extends State<BookPage> {
  final palabraTextField = TextEditingController();
  List<Palabra> Lp = [];
  Future<void> cargarPalabras() async {
    var lista = await DB.instance.getPalabras();
    setState(() => Lp = lista);
  }

  @override
  void initState() {
    setState(() {
      cargarPalabras();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  controller: palabraTextField,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // labelText: 'Buscar...',
                    hintText: 'Buscar...',
                    suffixIcon: Icon(Icons.search),
                  ),
                  style: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 25,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (palabraTextField.text.isNotEmpty) {
                          print(palabraTextField.text);
                          DB.instance.addPalabra(Palabra(
                            palabra: palabraTextField.text,
                          ));
                          palabraTextField.text = "";
                          initState();
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Color.fromARGB(255, 45, 17, 170),
                      ),
                      iconSize: 35,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text("ID",
                          style: TextStyle(fontSize: 25, fontFamily: 'Dosis')),
                    ),
                    DataColumn(
                        label: Text("PALABRA",
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'Dosis'))),
                    DataColumn(
                        label: Text("ELIMINAR",
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'Dosis'))),
                  ],
                  rows: Lp.map<DataRow>((item) => DataRow(cells: [
                        DataCell(Text(item.id.toString(),
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Dosis'))),
                        DataCell(Text(item.palabra.toString(),
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Dosis'))),
                        DataCell(IconButton(
                            onPressed: () async {
                              DB.instance.removePalabra(item);
                              palabraTextField.text = "";
                              initState();
                            },
                            icon: Icon(Icons.delete,
                                color: Color.fromARGB(255, 173, 12, 0))))
                      ])).toList(),
                )
              ],
            )),
      ),
    );
  }
}

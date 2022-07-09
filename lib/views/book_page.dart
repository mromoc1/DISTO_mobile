// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:app/constants.dart';
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
                SizedBox(height: 30),
                TextField(
                  controller: palabraTextField,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Pulsa enter para agregar',
                    labelText: 'AGREGAR NUEVA PALABRA',
                    suffixIcon: Icon(Icons.add_circle_outline),
                  ),
                  style: fuente_montserrat_diagonal_18,
                  onSubmitted: (value) async {
                    if (palabraTextField.text.isNotEmpty) {
                      print(palabraTextField.text);
                      DB.instance.addPalabra(Palabra(
                        palabra: palabraTextField.text,
                      ));
                      palabraTextField.text = "";
                      initState();
                    }
                  },
                ),
                SizedBox(height: 10),
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text("ID", style: fuente_montserrat_20),
                    ),
                    DataColumn(
                        label: Text("PALABRA", style: fuente_montserrat_20)),
                    DataColumn(
                        label: Text("ELIMINAR", style: fuente_montserrat_20)),
                  ],
                  rows: Lp.map<DataRow>((item) => DataRow(cells: [
                        DataCell(Text(item.id.toString(),
                            style: fuente_montserrat_20)),
                        DataCell(Text(item.palabra.toString(),
                            style: fuente_montserrat_20)),
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

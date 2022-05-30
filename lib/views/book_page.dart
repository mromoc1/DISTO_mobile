import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
                Text(
                  'GESTIONAR PALABRAS PROBLEMATICAS',
                  style: TextStyle(fontSize: 20, fontFamily: 'Dosis'),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      enabled: true,
                      filled: true,
                      icon: Icon(Icons.search),
                      labelText: 'BUSCAR PALABRA',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DataTable(columns: [
                  DataColumn(
                    label: Text('PALABRAS ALMACENADAS',
                        style: TextStyle(fontSize: 18, fontFamily: 'Dosis')),
                  ),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Palabra 1',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 2',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 3',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 4',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 5',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 6',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 7',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 8',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 9',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 10',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 11',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 12',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 13',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 14',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 15',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 16',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 16',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 17',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 18',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 19',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 20',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Palabra 21',
                        style: TextStyle(fontSize: 20, fontFamily: 'Dosis')))
                  ]),
                ])
              ],
            )),
      ));
}

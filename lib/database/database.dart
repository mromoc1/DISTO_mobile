import 'dart:io';

import 'package:app/database/palabras.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._privateConstructor();

  static final DB instance = DB._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'palabras.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
       CREATE TABLE palabrasProblematicasDB (
          id    INTEGER,
          palabra    TEXT NOT NULL,
          PRIMARY KEY(id AUTOINCREMENT)
       ) ''');
    List<dynamic> res = await batch.commit();
  }

  Future<List<Palabra>> getPalabras() async {
    Database db = await instance.database;
    var palabras =
        await db.query('palabrasProblematicasDB', orderBy: 'palabra');
    List<Palabra> lista = palabras.isNotEmpty
        ? palabras.map((c) => Palabra.fromMap(c)).toList()
        : [];

    return lista;
  }

  Future<int> removePalabra(Palabra palabra) async {
    Database db = await instance.database;
    return await db.delete('palabrasProblematicasDB',
        where: 'id = ?', whereArgs: [palabra.id]);
  }

  Future<int> addPalabra(Palabra palabra) async {
    Database db = await instance.database;
    return await db.insert('palabrasProblematicasDB', palabra.toMap());
  }
  // static Future<Database> _openDB() async {
  //   return openDatabase(join(await getDatabasesPath(), 'dbpalabras.db'),
  //       onCreate: (db, version) {
  //     return db.execute(
  //         "CREATE TABLE dbpalabras (id INTEGER PRIMARY KEY, palabraproblematica TEXT)");
  //   }, version: 1);
  // }

  // static Future<int> agregar(Palabra p) async {
  //   Database db = await _openDB();

  //   return db.insert("dbpalabras", p.toMap());
  // }

  // static Future<int> borrar(Palabra p) async {
  //   Database db = await _openDB();

  //   return db.delete("dbpalabras",
  //       where: "palabraproblematica = ?", whereArgs: [p.palabra]);
  // }

  // static Future<int> modificar(Palabra p) async {
  //   Database db = await _openDB();

  //   return db.update("dbpalabras", p.toMap(),
  //       where: "palabraproblematica = palabra", whereArgs: [p.palabra]);
  // }

  // static Future<List<Palabra>> obtenerPalabras() async {
  //   Database db = await _openDB();
  //   final List<Map<String, dynamic>> palabrasMap = await db.query("dbpalabras");
  //   return List.generate(
  //       palabrasMap.length,
  //       (i) => Palabra(
  //             id: palabrasMap[i]['id'],
  //             palabra: palabrasMap[i]['palabraproblematica'],
  //           ));
  // }
}

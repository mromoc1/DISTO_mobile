import 'package:app/database/palabras.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'dbpalabras.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE dbpalabras (id INTEGER PRIMARY KEY, palabraproblematica TEXT)");
    }, version: 1);
  }

  static Future<int> agregar(Palabra p) async {
    Database db = await _openDB();

    return db.insert("dbpalabras", p.toMap());
  }

  static Future<int> borrar(Palabra p) async {
    Database db = await _openDB();

    return db.delete("dbpalabras",
        where: "palabraproblematica = ?", whereArgs: [p.palabra]);
  }

  static Future<int> modificar(Palabra p) async {
    Database db = await _openDB();

    return db.update("dbpalabras", p.toMap(),
        where: "palabraproblematica = palabra", whereArgs: [p.palabra]);
  }

  static Future<List<Palabra>> obtenerPalabras() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> palabrasMap = await db.query("dbpalabras");
    return List.generate(
        palabrasMap.length,
        (i) => Palabra(
              id: palabrasMap[i]['id'],
              palabra: palabrasMap[i]['palabraproblematica'],
            ));
  }
}

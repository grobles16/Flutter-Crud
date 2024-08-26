import 'package:ejemplo/Models/articulo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Conection{
  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(), 'base.db'),
      onCreate: (db, version){
        return db.execute("CREATE TABLE articulos (id INTEGER PRIMARY KEY, titulo TEXT, contenido TEXT)");
      }, version: 1,
    );
  }

  static Future<int> insertArticulo(Articulo articulo) async{
    Database db = await _openDB();
    return db.insert("articulos", articulo.toMap()); 
  }

  static Future<int> deleteArticulo(Articulo articulo) async{
    Database db = await _openDB();
    return db.delete("articulos", where:'id = ?', whereArgs: [articulo.id]); 
  }

  static Future<int> updateArticulo(Articulo articulo) async{
    Database db = await _openDB();
    return db.update("articulos", articulo.toMap(), where:'id = ?', whereArgs: [articulo.id]); 
  }

  static Future<List<Articulo>> getArticulos() async{
    Database db = await _openDB();
    final List<Map<String, dynamic>> articulosMaps = await db.query('articulos');

    for (var n in articulosMaps) {
      print('____________Holaaaaaa');
      print(n['titulo']);
    }
    
    return List.generate(
      articulosMaps.length, 
      (i) => Articulo (
        id: articulosMaps[i]['id'],
        titulo: articulosMaps[i]['titulo'],
        contenido: articulosMaps[i]['contenido'],
      )
    );
  }
}
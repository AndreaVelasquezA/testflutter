/*import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class FavoriteDatabase{
  Database? _db;

  initDB() async {
    _db = await openDatabase('my_db.db',
    version:1, 
    onCreate: (Database db, int version ){
      db.execute("CREATE TABLE favoritos (id INTEGER PRIMARY KEY, nameartic TEXT NOT NULL, nameven TEXT NOT NULL, rate TEXT NOT NULL, fav BOOLEAN )");
    });
  
  }



}*/


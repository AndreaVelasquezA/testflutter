import 'dart:io';
import 'package:examen_movil/model/articles.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBArticles {
  static Database? _database;
  static final DBArticles db = DBArticles._();

  DBArticles._();

    
  Future<Database> get database async =>
      _database ??= await initDB();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'article_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Article('
          'id INTEGER PRIMARY KEY,'
          'nombreart TEXT,'
          'nombreven TEXT,'
          'rate TEXT,'
          'favorite INTEGER,'
          'imagen TEXT,'
          ')');
    });
  }

  // Insert employee on database
  createArticle(Article newArticle) async {
    await deleteAllArticles();
    final db = await database;
    final res = await db.insert('Article', newArticle.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllArticles() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Article');

    return res;
  }

  Future<List<Article>> getAllArticles() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM ARTICLE");

    List<Article> list =
        res.isNotEmpty ? res.map((c) => Article.fromJson(c)).toList() : [];

    return list;
  }
}
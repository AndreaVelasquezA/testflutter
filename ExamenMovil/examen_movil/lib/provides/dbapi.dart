
import 'package:dio/dio.dart';
import 'package:examen_movil/databaseart.dart';
import 'package:examen_movil/model/articles.dart';

class ArticlesApiProvider {

  Future<List<Article?>> getAllArticles() async {
    var url = "https://api.npoint.io/1705c1d0425eed01306c";
    Response response = await Dio().get(url);


    return (response.data as List).map((article) {
      print('Inserting $article');
      DBArticles.db.createArticle(Article.fromJson(article));
    }).toList();

  }
}
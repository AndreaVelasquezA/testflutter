import 'dart:convert';

List<Article> articlesFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articlesToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  final String? nombreart;
  final String? nombreven;
  final int? rate;
  final int? favorite;
  final String? img;

   
  Article({
    this.nombreart, 
    this.nombreven,
    this.rate, 
    this.favorite, 
    this.img,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
          nombreart : json["nombreart"],
          nombreven : json['nombreven'],
          rate : json['rate'],
          favorite : json['favorite'],
          img : json['imagen']
      );

  Map<String, dynamic> toJson() => {
     
        "nombreart": nombreart,
        "nombreven": nombreven,
        "rate": rate,
        "favorite": favorite,
        "img": img,
      };
}

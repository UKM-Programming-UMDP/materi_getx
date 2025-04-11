import 'package:materi_getx/models/source_model.dart';

class ArticleModel {
  final SourceModel source;
  final DateTime publishedAt;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  ArticleModel({
    required this.source,
    required this.publishedAt,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'],
    );
  }
}

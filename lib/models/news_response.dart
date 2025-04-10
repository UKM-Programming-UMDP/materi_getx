import 'package:materi_getx/models/article_model.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<ArticleModel>.from(
        json['articles'].map((article) => ArticleModel.fromJson(article)),
      ),
    );
  }
}

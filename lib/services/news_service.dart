import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:materi_getx/models/article_model.dart';
import 'package:materi_getx/models/news_response.dart';

class NewsService {
  final String _apiKey = 'YOUR API KEY';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<ArticleModel>> fetchTopTechHeadlines() async {
    final url =
        Uri.parse('$_baseUrl?country=us&category=technology&apiKey=$_apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final newsResponse = NewsResponse.fromJson(data);
      return newsResponse.articles;
    } else {
      throw Exception('Failed to load news: ${response.reasonPhrase}');
    }
  }
}

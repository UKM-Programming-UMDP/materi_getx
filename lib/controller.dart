import 'package:get/get.dart';
import 'package:materi_getx/models/article_model.dart';
import 'package:materi_getx/services/news_service.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;

  final NewsService _newsService = NewsService();

  var isLoading = true.obs;
  var articles = <ArticleModel>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      isLoading.value = true;
      error.value = '';
      final fetchedArticles = await _newsService.fetchTopTechHeadlines();
      articles.value = fetchedArticles;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

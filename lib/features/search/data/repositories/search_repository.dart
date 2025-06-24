import 'package:news/core/service/api_service.dart';
import 'package:news/features/home/data/model/news_model.dart';

class SearchRepository {
  final ApiService apiService;

  SearchRepository({required this.apiService});

  Future<List<NewsModel>> searchArticles(String query) async {
    final searchUrl =
        "https://newsapi.org/v2/everything?q=$query&apiKey=8cbd5905fc194454b7d570ab130d9f49";

    final tempService = ApiService(baseUrl: searchUrl);

    return await tempService.fetchArticles();
  }
}

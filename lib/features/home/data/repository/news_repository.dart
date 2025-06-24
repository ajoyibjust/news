import 'package:news/core/service/api_service.dart';
import 'package:news/features/home/data/model/news_model.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<List<NewsModel>> getArticles() async {
    return await apiService.fetchArticles();
  }
}
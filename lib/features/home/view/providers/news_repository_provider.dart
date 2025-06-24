import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/service/api_service.dart';
import 'package:news/features/home/data/repository/news_repository.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final apiService = ApiService(
    baseUrl:
        "https://newsapi.org/v2/everything?q=tesla&from=2025-05-23&sortBy=publishedAt&apiKey=8cbd5905fc194454b7d570ab130d9f49",
  );
  return NewsRepository(apiService: apiService);

  
});

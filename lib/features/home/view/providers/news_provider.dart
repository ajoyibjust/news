import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'news_repository_provider.dart';

final newsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final repo = ref.watch(newsRepositoryProvider);
  return await repo.getArticles();
});

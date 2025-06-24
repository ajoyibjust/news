import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/search/view/providers/search_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");

final searchResultsProvider = FutureProvider.autoDispose<List<NewsModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final repository = ref.watch(searchRepositoryProvider);
  return await repository.searchArticles(query);
});

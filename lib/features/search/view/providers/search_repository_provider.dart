import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/service/api_service.dart';
import 'package:news/features/search/data/repositories/search_repository.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(
    apiService: ApiService(baseUrl: ""),
  );
});

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/features/home/data/model/news_model.dart';

class ApiService {
  final String? baseUrl;

  ApiService({this.baseUrl});

  Future<List<NewsModel>> fetchArticles() async {
    final url = Uri.parse(baseUrl ?? "");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> articlesJson = data['articles'];
      return articlesJson.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception("Xatolik: ${response.statusCode}");
    }
  }
}

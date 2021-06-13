import 'package:dio/dio.dart';
import 'package:newsapp_mvvm/models/news_article.dart';

class ApiService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=7222c2a6c5294f9784f6974bdb3566ad";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else
      throw Exception("failed to get top headlines data");
  }
}

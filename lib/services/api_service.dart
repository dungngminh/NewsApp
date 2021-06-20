import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:newsapp_mvvm/models/news_article.dart';
import 'package:newsapp_mvvm/utils/constants.dart';

class ApiService {
  //default : us
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    var url = Uri.parse(Constants.TOP_HEADLINE_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var result = convert.jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else
      throw Exception("failed to get top headlines data");
  }

  Future<List<NewsArticle>> fetchTopHeadlinesByCountry(String country) async {
    var url = Uri.parse(Constants.headlinesFor(country));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var result = convert.jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else
      throw Exception("failed to get top headlines data");
  }
}

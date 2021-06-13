import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/models/news_article.dart';
import 'package:newsapp_mvvm/services/api_service.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_viewmodel.dart';

enum LoadingStatus { completed, pending, empty }

class NewsArticleListViewModel with ChangeNotifier {
  var loadingStatus = LoadingStatus.empty;
  var articles = <NewsArticleViewModel>[];
  void topHeadlines() async {
    List<NewsArticle> newsArticles = await ApiService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.pending;

    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}

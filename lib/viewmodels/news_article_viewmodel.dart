import 'package:intl/intl.dart';
import 'package:newsapp_mvvm/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle? article}) : _newsArticle = article!;

  String get title => _newsArticle.title;
  String get author => _newsArticle.author;
  String get des => _newsArticle.des;
  String get url => _newsArticle.url;
  String get urlToImage => _newsArticle.urlToImage;
  String get publishedAt => DateFormat.yMMMMEEEEd("en-us").format(
      DateFormat("yyy-mm-ddTHH:mm:ssZ").parse(_newsArticle.publishedAt, true));
  String get content => _newsArticle.content;
}

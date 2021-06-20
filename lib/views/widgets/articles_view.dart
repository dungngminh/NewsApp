import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_viewmodel.dart';
import 'package:newsapp_mvvm/views/news_detail_screen.dart';
import 'package:newsapp_mvvm/views/widgets/article_image.dart';

class ArticlesView extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const ArticlesView({required this.articles});

  void _showNewsAriticleDetail(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () => _showNewsAriticleDetail(context, article),
          child: GridTile(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ArticleImage(
                urlToImage: article.urlToImage,
              ),
            ),
            footer: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}

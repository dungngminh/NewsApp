import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_viewmodel.dart';
import 'package:newsapp_mvvm/views/widgets/article_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/icon.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Author",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  article.author,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Divider(
                  height: 80,
                  thickness: 20,
                  color: Colors.amber[700],
                ),
                Text(
                  "Headline",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              article.publishedAt,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ArticleImage(
                urlToImage: article.urlToImage,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              article.des,
              style: TextStyle(fontSize: 20, wordSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}

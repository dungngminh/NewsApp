import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            listViewModel.articles.length.toString(),
          ),
        ));
  }
}

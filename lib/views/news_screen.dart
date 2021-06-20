import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/utils/constants.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_list_viewmodel.dart';
import 'package:newsapp_mvvm/views/widgets/articles_view.dart';
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
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (country) => listViewModel.topHeadlinesByCountry(
              Constants.Countries[country],
            ),
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => Constants.Countries.keys
                .map(
                  (e) => PopupMenuItem(
                    child: Text(e),
                    value: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              "News",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Divider(
            color: Colors.amber[700],
            height: 40,
            thickness: 9,
            indent: 40,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 15, bottom: 15),
            child: Text(
              "Headlines",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: ArticlesView(
              articles: listViewModel.articles,
            ),
          ),
        ],
      ),
    );
  }
}

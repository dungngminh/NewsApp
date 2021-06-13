import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/viewmodels/news_article_list_viewmodel.dart';
import 'package:newsapp_mvvm/views/news_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New App",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NewsArticleListViewModel(),
          ),
        ],
        child: NewsScreen(),
      ),
    );
  }
}

class NewsArticle {
  final String title;
  final String author;
  final String des;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticle(
      {required this.title,
      required this.author,
      required this.des,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'] ?? "",
        author: json['author'] ?? "",
        des: json['description'] ?? "",
        url: json['url'] ?? "",
        urlToImage: json['urlToImage'] ?? "",
        publishedAt: json['publishedAt'] ?? "",
        content: json['content'] ?? "");
  }
}

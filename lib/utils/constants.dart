class Constants {
  static const API_KEY = "7222c2a6c5294f9784f6974bdb3566ad";
  static const String TOP_HEADLINE_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY";

  static String headlinesFor(String country) =>
      "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY";
  static const Map<String, String> Countries = {
    "USA": "us",
    "India": "in",
    "Korea": "kr",
    "China": "cn",
  };
}

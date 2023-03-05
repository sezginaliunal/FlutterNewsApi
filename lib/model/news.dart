class News {
  String title;
  String description;
  String source;
  String url;
  String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.source,
    required this.url,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      source: json['source']['name'] ?? "",
      url: json['url'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
    );
  }
}

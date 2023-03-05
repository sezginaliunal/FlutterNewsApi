import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model/news.dart';

class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '<YOUR API KEY>';
  //Get the api key from _baseUrl

  static Future<List<News>> fetchNews({String query = 'cryptocurrency'}) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/everything?q=$query&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final articles = jsonResponse['articles'] as List<dynamic>;

      return articles.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}

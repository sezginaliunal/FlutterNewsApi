import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/screen/new_details.dart';
import 'package:news/services/newService.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final newsList = await NewsService.fetchNews();
    setState(() => _newsList = newsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: _newsList.isEmpty
          ? Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              itemCount: _newsList.length,
              itemBuilder: (context, index) {
                final news = _newsList[index];
                return ListTile(
                  leading: Image.network(news.imageUrl),
                  title: Text(news.title),
                  subtitle: Text(news.description),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDetailPage(news: news)),
                    );
                  },
                );
              },
            ),
    );
  }
}

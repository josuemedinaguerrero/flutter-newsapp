import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';
import 'package:http/http.dart' as http;

const _apiKey = '155253c78c4145c380939bfd2f58e367';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https('newsapi.org', 'v2/top-headlines', {
      'country': 'us',
      'apiKey': _apiKey,
    });

    final res = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(res.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}

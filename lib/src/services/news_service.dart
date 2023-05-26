import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Cargando headlines');
  }
}

import 'package:bsi_news/data/datasource.dart';
import 'package:bsi_news/data/repositories.dart';
import 'package:bsi_news/model/news.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  final _repository = Repository(DataSource());

  List<News> _news = [];

  List<News> get news => _news;

  Future<void> getNews() async {
    _news = await _repository.getNews();
    print(_news.length);
    notifyListeners();
  }
}

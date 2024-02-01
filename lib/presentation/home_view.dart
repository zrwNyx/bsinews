import 'package:bsi_news/data/datasource.dart';
import 'package:bsi_news/provider/newsprovider.dart';
import 'package:bsi_news/widgets/card_view.dart';
import 'package:bsi_news/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: newsProvider.getNews(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: newsProvider.news.length,
              itemBuilder: (context, index) {
                return CardNews(
                    imagePath: newsProvider.news[index].urlToImage,
                    title: newsProvider.news[index].title,
                    url: newsProvider.news[index].url);
              },
            );
          },
        ),
      ),
    );
  }
}

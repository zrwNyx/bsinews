import 'package:bsi_news/data/datasource.dart';
import 'package:bsi_news/data/repositories.dart';
import 'package:bsi_news/model/news.dart';
import 'package:bsi_news/presentation/favorite_view.dart';
import 'package:bsi_news/presentation/home_view.dart';
import 'package:bsi_news/provider/newsprovider.dart';
import 'package:flutter/material.dart';
import 'package:bsi_news/main.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('BSI News'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.star), text: 'Favorite'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomeView(),
              FavoriteView(),
            ],
          ),
        ),
      ),
    );
  }
}

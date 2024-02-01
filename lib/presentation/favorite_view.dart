import 'package:bsi_news/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Box<Map> bookmarkBox = Hive.box<Map>('favorites');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite News'),
      ),
      body: BookmarkList(),
    );
  }
}

class BookmarkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Box<Map> bookmarkBox = Hive.box<Map>('favorites');

    return ValueListenableBuilder(
      valueListenable: bookmarkBox.listenable(),
      builder: (context, Box<Map> box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            Map bookmark = box.getAt(index)!;
            return ListTile(
              title: Text(bookmark['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WebViewContainer(url: bookmark['url']),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

import 'package:bsi_news/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardNews extends StatelessWidget {
  final String imagePath;
  final String title;
  final String url;

  CardNews({required this.imagePath, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    Hive.openBox<Map>('favorites');
    return Card(
      elevation: 5, // You can adjust the elevation as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewContainer(url: url)));
                },
                child: Image.network(
                  imagePath,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: GestureDetector(
                  onTap: () {
                    Hive.box<Map>('favorites')
                        .add({'title': title, 'url': url});
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 52,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewsDisplay extends StatelessWidget {
  final String title;
  final String urlToImage;
  final String content;

  const NewsDisplay(
      {super.key,
      required this.content,
      required this.title,
      required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        children: [Text('Title'), Text('urlToimage'), Text('control')],
      ),
    );
  }
}

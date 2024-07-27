import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final dynamic news;

  NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(news['title']),
        subtitle: Text(news['summary']),
      ),
    );
  }
}

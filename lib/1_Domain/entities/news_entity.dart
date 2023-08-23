//import 'package:dartz/dartz_streaming.dart';
import 'package:equatable/equatable.dart';
import 'package:news/0_Data/models/news_model.dart';

class NewsEntity extends Equatable {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  NewsEntity({
    required this.description,
    required this.title,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.source,
    required this.url,
    required this.urlToImage,
  });

  @override
  List<Object?> get props => [
        source,
        title,
        description,
        author,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

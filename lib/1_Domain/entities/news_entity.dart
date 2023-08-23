//import 'package:dartz/dartz_streaming.dart';
import 'package:equatable/equatable.dart';
import 'package:news/0_Data/models/news_model.dart';

class NewsEntity extends Equatable {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsEntity({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}

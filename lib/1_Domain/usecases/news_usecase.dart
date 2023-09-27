import 'package:news/0_Data/repositories/news_repo_implementation.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:news/1_Domain/failure/failure.dart';
import 'package:news/1_Domain/repositories/news_repo.dart';

class NewsUseCases {
  final NewsRepo newsRepo;
  NewsUseCases({required this.newsRepo});
  Future<Either<Failure, NewsEntity>> getnewsData() async {
    return newsRepo.getnewsData();
  }
}

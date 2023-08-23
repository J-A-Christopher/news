import 'package:news/0_Data/repositories/news_repo_implementation.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:news/1_Domain/failure/failure.dart';

class NewsUseCases {
  Future<Either<Failure, NewsEntity>> getnewsData() async {
    final newsRepo = NewsRepoImpl();
    return newsRepo.getnewsData();
  }
}

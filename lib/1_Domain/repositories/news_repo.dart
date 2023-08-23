import 'package:dartz/dartz.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:news/1_Domain/failure/failure.dart';

abstract class NewsRepo {
  Future<Either<Failure, NewsEntity>> getnewsData();
}

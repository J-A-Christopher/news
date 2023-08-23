import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:news/1_Domain/failure/failure.dart';

class NewsUseCases {
  Future<Either<Failure, NewsEntity>> getnewsData() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return right(NewsEntity(
        description: 'good news',
        title: 'Police die',
        author: 'Jesse',
        url: 'www',
        urlToImage: 'gfs',
        content: 'neema',
        publishedAt: 'fes',
        source: null));
    //return Left(GeneralFailure());
  }
}

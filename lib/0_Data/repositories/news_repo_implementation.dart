import 'package:dartz/dartz.dart';
import 'package:news/0_Data/datasources/news_remote_datasorce.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:news/1_Domain/failure/failure.dart';
import 'package:news/1_Domain/repositories/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSourceImpl();
  @override
  Future<Either<Failure, NewsEntity>> getnewsData() async {
    final result = await newsRemoteDataSource.getNewsFromApi();
    return right(result);
  }
}

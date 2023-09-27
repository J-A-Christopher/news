import 'package:dartz/dartz.dart';
import 'package:news/0_Data/datasources/news_remote_datasorce.dart';
import 'package:news/0_Data/exceptions/exceptions.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:news/1_Domain/failure/failure.dart';
import 'package:news/1_Domain/repositories/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource;
  NewsRepoImpl({required this.newsRemoteDataSource});
  @override
  Future<Either<Failure, NewsEntity>> getnewsData() async {
    try {
      final result = await newsRemoteDataSource.getNewsFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (error) {
      return left(GeneralFailure());
    }
  }
}

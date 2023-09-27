import 'package:get_it/get_it.dart';
import 'package:news/0_Data/datasources/news_remote_datasorce.dart';
import 'package:news/0_Data/repositories/news_repo_implementation.dart';
import 'package:news/1_Domain/usecases/news_usecase.dart';
import 'package:news/2_Prsesntation/bloc/news_bloc.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I;

Future<void> init() async {
  //Data Layer
  serviceLocator.registerFactory<NewsRemoteDataSourceImpl>(
      () => NewsRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerFactory<NewsRepoImpl>(() => NewsRepoImpl(
      newsRemoteDataSource: serviceLocator<NewsRemoteDataSourceImpl>()));
  //Domain Layer
  serviceLocator.registerFactory<NewsUseCases>(
      () => NewsUseCases(newsRepo: serviceLocator<NewsRepoImpl>()));
  //Presentation Layer
  serviceLocator.registerFactory<NewsBloc>(
      () => NewsBloc(newsUseCases: serviceLocator<NewsUseCases>()));
  //Externs
  serviceLocator.registerFactory(() => http.Client());
}

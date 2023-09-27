import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news/0_Data/models/news_model.dart';
import 'package:news/1_Domain/entities/news_entity.dart';
import 'package:news/1_Domain/failure/failure.dart';
import 'package:news/1_Domain/usecases/news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

const serverFailure = 'Server failure try again later';
const generalFailure = 'Something went wrong. Try again..';
const defaultMessage = 'Oops something went wrong.';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCases newsUseCases;
  NewsBloc({required this.newsUseCases}) : super(NewsInitial()) {
    on<GetNews>(
      (event, emit) async {
        emit(NewsInitial());
        emit(NewsLoading());
        String _mapStringToFailure(Failure failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              return serverFailure;
            case GeneralFailure:
              return generalFailure;
            default:
              return defaultMessage;
          }
        }

        final newsData = await newsUseCases.getnewsData();
        newsData.fold(
            (failure) => emit(NewsError(error: _mapStringToFailure(failure))),
            (news) => emit(NewsLoaded(result: news.articles)));
      },
    );
  }
}

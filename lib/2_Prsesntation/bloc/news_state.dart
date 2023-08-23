part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final result;
  NewsLoaded({required this.result});
  @override
  List<Object?> get props => [result];
}

class NewsError extends NewsState {
  final String error;
  NewsError({required this.error});
  @override
  List<Object?> get props => [error];
}

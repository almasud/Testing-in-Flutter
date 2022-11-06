part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingError extends NewsState {
  final AppError error;

  const NewsLoadingError(this.error);

  @override
  List<Object> get props => [error];
}

class NewsLoaded extends NewsState {
  final List<Article> articles;

  const NewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

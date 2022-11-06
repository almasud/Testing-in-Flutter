part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsFetchEvent extends NewsEvent {
  const NewsFetchEvent();

  @override
  List<Object?> get props => [];
}

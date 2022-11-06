import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:testing_in_flutter/domain/exceptions.dart';
import 'package:testing_in_flutter/domain/model/news_repo.dart';

import '../model/article.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo newsRepo;

  NewsBloc(this.newsRepo) : super(NewsInitial()) {
    on<NewsFetchEvent>(_newsFetched);
  }

  _newsFetched(NewsFetchEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepo.getArticles();
      emit(NewsLoaded(articles));
    } on SocketException {
      emit(NewsLoadingError(NoInternetAppError("No Internet!")));
    } on FormatException {
      emit(NewsLoadingError(
          InvalidFormatAppError("The response format is invalid!")));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(NewsLoadingError(UnknownAppError("Unknown error!")));
    }
  }
}

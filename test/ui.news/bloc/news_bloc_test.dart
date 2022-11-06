import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_in_flutter/domain/model/news_repo.dart';
import 'package:testing_in_flutter/ui/news/bloc/news_bloc.dart';
import 'package:testing_in_flutter/ui/news/model/article.dart';


class MockNewsRepo extends Mock implements NewsRepo {}

void main() {
  late NewsBloc newsBloc;
  late MockNewsRepo mockNewsRepo;

  setUp(() {
    mockNewsRepo = MockNewsRepo();
    newsBloc = NewsBloc(mockNewsRepo);
  });

  group('getArticles', () {
    final articlesFromService = [
      Article(title: 'Test 1', content: 'Test 1 content'),
      Article(title: 'Test 2', content: 'Test 2 content'),
      Article(title: 'Test 3', content: 'Test 3 content'),
    ];

    void arrangeNewsServiceReturns3Articles() {
      when(() => mockNewsRepo.getArticles()).thenAnswer(
        (_) async => articlesFromService,
      );
    }

    blocTest(
      'emits [NewsLoaded]',
      build: () {
        arrangeNewsServiceReturns3Articles();
        return NewsBloc(mockNewsRepo);
      },
      act: (bloc) {
        newsBloc.add(const NewsFetchEvent());
      },
      expect: () => <NewsState>[
        NewsLoaded(articlesFromService)
      ],
    );

  });
}

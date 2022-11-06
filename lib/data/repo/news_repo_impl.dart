import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:testing_in_flutter/domain/model/news_repo.dart';
import 'package:testing_in_flutter/ui/news/model/article.dart';

class NewsRepoImpl extends NewsRepo {
  // Simulating a remote database
  final _articles = List.generate(
    10,
        (_) => Article(
      title: lorem(paragraphs: 1, words: 3),
      content: lorem(paragraphs: 10, words: 500),
    ),
  );

  @override
  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }

}
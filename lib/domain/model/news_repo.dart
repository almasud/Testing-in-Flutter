import 'package:testing_in_flutter/ui/news/model/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getArticles();
}
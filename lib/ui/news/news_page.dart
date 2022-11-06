import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/error.dart';
import 'article/article_page.dart';
import 'bloc/news_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = BlocProvider.of<NewsBloc>(context);

    _loadingArticles();
  }

  _loadingArticles() {
    _newsBloc.add(const NewsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: SafeArea(
          child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsLoaded) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (_, index) {
              final article = state.articles[index];
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ArticlePage(article: article),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(article.title),
                    subtitle: Text(
                      article.content,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
          );
        } else if (state is NewsLoadingError) {
          String message = "${state.error.message}\nTap to retry";
          return Center(
              child: ErrorText(
            message: message,
            onPressed: _loadingArticles,
          ));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              key: Key('progress-indicator'),
            ),
          );
        }
      })),
    );
  }
}

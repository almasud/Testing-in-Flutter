import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_in_flutter/ui/news/bloc/news_bloc.dart';
import 'package:testing_in_flutter/ui/news/news_page.dart';

import 'data/repo/news_repo_impl.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: BlocProvider(
        create: (_) => NewsBloc(NewsRepoImpl()),
        child: const NewsPage(),
      ),
    );
  }
}

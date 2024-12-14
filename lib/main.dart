import 'package:flutter/material.dart';
import 'package:mvvm/model/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/view/posts_view.dart';
import 'package:mvvm/repositories/post_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostsProvider(postsRepository: PostsAPI()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsView(),
      ),
    );
  }
}
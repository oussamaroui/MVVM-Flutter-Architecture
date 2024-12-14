import 'package:flutter/material.dart';
import 'package:mvvm/model/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/repositories/post_api.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) =>
            PostsProvider(postsRepository: PostsAPI())..fetchAllPosts(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: const Center(child: Text('All Posts')),
          ),
          body: Consumer<PostsProvider>(
            builder: (context, postsProvider, child) {
              if (postsProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (postsProvider.error != null) {
                return Center(
                  child: Text('Error: ${postsProvider.error}'),
                );
              }

              if (postsProvider.posts.isEmpty) {
                return const Center(child: Text('No posts found.'));
              }

              return ListView.builder(
                itemCount: postsProvider.posts.length,
                itemBuilder: (context, index) {
                  final post = postsProvider.posts[index];
                  return ListTile(
                    title: Text('${post.id} - ${post.title}'),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:mvvm/model/post_model.dart';
import 'package:mvvm/repositories/post_repo.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (exception) {
      print('Error fetching posts: $exception');
      return [];
    }
  }

  @override
  Future<PostModel> getPostById(int id) async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/$id');
      return PostModel.fromJson(response.data);
    } catch (exception) {
      throw Exception("Failed to load post: $exception");
    }
  }
}

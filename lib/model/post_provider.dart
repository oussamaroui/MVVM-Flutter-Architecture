import 'package:flutter/foundation.dart';
import 'package:mvvm/repositories/post_repo.dart';
import 'package:mvvm/model/post_model.dart';

class PostsProvider with ChangeNotifier {
  final PostsRepository postsRepository;

  PostsProvider({required this.postsRepository});

  List<PostModel> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAllPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await postsRepository.getAllPosts();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}

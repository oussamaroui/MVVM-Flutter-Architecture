// import 'package:mvvm/model/post_model.dart';
// import 'package:mvvm/model_view/post_vm.dart';
// import 'package:mvvm/repositories/post_repo.dart';

// class PostsMV {

//   final String title = 'All Posts';

//   final PostsRepository postsRepository;

//   PostsMV({required this.postsRepository}); 

//   Future<List<PostVM>> fetchAllPosts() async {
//     List<PostModel> list = await postsRepository.getAllPosts(); 
//     return list.map((post) => PostVM(postModel: post)).toList();
//   }
// }

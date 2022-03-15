import 'package:flutter/cupertino.dart';
import 'package:mvvm/models/post_model.dart';
import '../models/services/posts_service.dart';

class PostsProvider with ChangeNotifier {
  // our state
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  Future<void> loadPosts() async {
    PostService postService = PostService();
    _posts = await postService.getPosts();
    notifyListeners();
  }
}

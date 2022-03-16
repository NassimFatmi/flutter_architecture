import 'abstract_provider.dart';
import '../models/errors/failure.dart';
import '../models/notifier_state.dart';
import '../models/post_model.dart';
import '../models/services/posts_service.dart';

class PostsProvider extends AbstractProvider {
  // our state
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  Future<void> loadPosts() async {
    PostService postService = PostService();
    // set the state to loading => show progress
    try {
      // get the data
      // await Future.delayed(const Duration(seconds: 2));
      _posts = await postService.getPosts();
    } on Failure catch (f) {
      // error case
      setProviderFailure(f);
    }
    setProviderState(NotifierState.loaded);
  }
}

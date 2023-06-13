import 'package:dart_basic/homework/post/model/post.dart';
import 'package:dart_basic/homework/post/repository/post_repository.dart';

class PostMemoryRepositoryImpl implements PostRepository {
  List<Post> _posts = [];

  @override
  Future<void> addPost(Post post) async {
    _posts.add(post);
  }

  @override
  Future<void> deletePost(Post post) async {
    _posts.remove(post);
  }

  @override
  Future<List<Post>> getPosts() async {
    return _posts;
  }

  @override
  Future<void> updatePost(Post post) async {
    _posts = _posts.map((e) {
      if (e.id == post.id) {
        return post;
      }
      return e;
    }).toList();
  }
}

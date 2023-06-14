import 'dart:io';

import 'package:dart_basic/homework/post/model/post.dart';
import 'package:dart_basic/homework/post/repository/post_file_repository_impl.dart';
import 'package:dart_basic/homework/post/repository/post_repository.dart';
import 'package:test/test.dart';

// 06.13.과제
// 5번.

void main() {
  PostRepository _repository = PostFileRepositoryImpl('lib/homework/post/file');

  setUp(() async {
    await _repository.addPost(Post(0, 'test1', 'test1'));
    await _repository.addPost(Post(1, 'test2', 'test2'));
  });

  tearDown(() async {
    final dir = Directory('lib/homework/post/file');
    if (await dir.exists()) {
      await Directory('lib/homework/post/file').delete();
    }
    _repository = PostFileRepositoryImpl('lib/homework/post/file/');
  });

  group('PostRepository', () {
    test('getPosts()', () async {
      final posts = await _repository.getPosts();
      expect(posts.length, 2);
    });

    test('addPost()', () async {
      await _repository.addPost(Post(2, 'test3', 'test3'));

      var posts = await _repository.getPosts();
      expect(posts.length, 3);

      await _repository.addPost(Post(3, 'test4', 'test4'));

      posts = await _repository.getPosts();
      expect(posts.length, 4);
    });

    test('updatePost()', () async {
      await _repository.updatePost(Post(0, '0', '0'));
      final firstPost = (await _repository.getPosts())[0];
      expect(firstPost.title, '0');
    });

    test('deletePost()', () async {
      final post = Post(0, 'test1', 'test1');
      await _repository.deletePost(post);
      final posts = await _repository.getPosts();
      expect(posts.length, 1);
    });
  });

  test('PostFileRepository 테스트', () async {
    // 준비
    final PostRepository repository =
        PostFileRepositoryImpl('lib/homework/post/file/');

    final posts = await repository.getPosts();
    expect(posts.length, 0);

    final post = Post(0, 'test1', 'test1');
    await repository.addPost(post);
    expect(posts.length, 1);

    await repository.updatePost(Post(0, 'test2', 'test2'));
    final firstPost = (await repository.getPosts())[0];
    expect(firstPost.title, 'test2');

    await repository.deletePost(post);
    expect(posts.length, 1);
  });
}

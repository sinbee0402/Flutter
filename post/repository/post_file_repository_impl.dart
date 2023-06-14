import 'dart:convert';
import 'dart:io';

import 'package:dart_basic/homework/post/model/post.dart';
import 'package:dart_basic/homework/post/repository/post_repository.dart';

// 06.13.과제
// 5번.

class PostFileRepositoryImpl implements PostRepository {
  final String _path;

  PostFileRepositoryImpl(this._path);

  List<Post> _posts = [];

  // 직렬화 해서 저장
  // 역직렬화 해서 보관

  @override
  Future<void> addPost(Post post) async {
    // 포스트 추가
    final file = File('$_path/${post.title}');
    if (await file.exists()) {
      await file.writeAsString(jsonEncode(post.toJson()));
    }
    _posts.add(post);
  }

  @override
  Future<void> deletePost(Post post) async {
    // 포스트 삭제
    final file = File('$_path/${post.title}');
    if (await file.exists()) {
      _posts.remove(post); // remove는 Object타입
      await file.delete();
      print('파일을 삭제합니다.');
    } else {
      print('해당 파일이 존재하지 않습니다.');
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    // 포스트 불러오기
    final dir = Directory('$_path');
    // 디렉토리 정보 불러오기
    if (await dir.exists()) {
      final files = dir.listSync();
      _posts = files
          .map((e) => e as File)
          .map((e) => e.readAsStringSync())
          .map((e) => jsonDecode(e))
          .map((e) => Post.fromJson(e))
          .toList();
      return _posts;
    } else {
      print('해당 파일이 존재하지 않습니다.');
      return [];
    }
  }

  @override
  Future<void> updatePost(Post post) async {
    // 포스트 업데이트/수정
    _posts = _posts.map((e) {
      if (e.id == post.id) {
        final file = File('$_path/${post.title}');
        if (file.existsSync()) {
          file.writeAsStringSync(jsonEncode(post.toJson()));
        }
        return post;
      }
      return e;
    }).toList();
  }
}

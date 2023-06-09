import 'dart:convert';

import 'package:dart_basic/homework/HTTP/Movie/model/MovieDetail.dart';
import 'package:dart_basic/homework/HTTP/Movie/model/movie.dart';
import 'package:http/http.dart' as http;

// 06.08.과제

void main() async {
  // print(await getAllInfo());

  // 1번. 영화 정보
  final movie = await getMovieInfo();
  movie.forEach((e) {
    print('영화 정보');
    print('제목: ${e.title}');
    print('줄거리: ${e.overview}\n');
  });

  // 2번. 영화 상세 정보
  final MovieDetail info = MovieDetail.fromJson(await getDetailInfo(569094));
  print(info);
}

// 1번. 영화 정보
Future<List<Movie>> getMovieInfo() async {
  // error 2. List type <dynamic> -> <Movie>

  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
  final allInfo = jsonDecode(response.body);
  final List<dynamic> results = allInfo['results'];
  // error 1. Human error: result -> results

  return results.map((e) => Movie.fromJson(e)).toList();
}

// 2번. 영화 상세 정보
Future<Map<String, dynamic>> getDetailInfo(int movieId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
  return jsonDecode(response.body);
}

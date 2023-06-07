import 'dart:convert';

// 06.07.과제
// 2번.

void main() async {
  final movieInfo = await getMovieInfo();
  final data = jsonDecode(movieInfo);
  print('director: ${data['director']}');
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };
  return jsonEncode(mockData);
}

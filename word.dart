// 05.31.과제
// 2번.

class Word {
  String word = '';

  bool isVowel(int i) =>
      word.substring(i, i + 1).contains(RegExp(r'[aeiouAEIOU]'));

  bool isConsonant(int i) {
    if (word.substring(i, i + 1).contains(RegExp(r'[aeiouAEIOU]'))) {
      return false;
    } else {
      return true;
    }
  }
}

void main() {
  Word word = Word();
  word.word = 'apple';

  print(word.isVowel(0));
  print(word.isVowel(1));
  print(word.isVowel(2));
  print(word.isVowel(3));
  print(word.isVowel(4));
  print('\n');

  print(word.isConsonant(0));
  print(word.isConsonant(1));
  print(word.isConsonant(2));
  print(word.isConsonant(3));
  print(word.isConsonant(4));
  print('\n');

  word.word = 'APPLE';
  print(word.isVowel(0));
  print(word.isVowel(1));
  print(word.isVowel(2));
  print(word.isVowel(3));
  print(word.isVowel(4));
  print('\n');

  print(word.isConsonant(0));
  print(word.isConsonant(1));
  print(word.isConsonant(2));
  print(word.isConsonant(3));
  print(word.isConsonant(4));
  print('\n');
}

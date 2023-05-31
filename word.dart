class Word {
  String word = '';

  bool isVowel(int i) {
    return word.substring(i, i + 1).contains(RegExp(r'[aeiouAEIOU]'));
  }

  bool isConsonant(int i) {
    return false;
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

  word.word = 'APPLE';
  print(word.isVowel(0));
  print(word.isVowel(1));
  print(word.isVowel(2));
  print(word.isVowel(3));
  print(word.isVowel(4));
}

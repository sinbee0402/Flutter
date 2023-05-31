// 05.30.과제

class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.comment,
    required this.publishDate,
  });

  // List, Set, Map에서 자유롭게 사용하기
  // Generate에서 자동완성 가능하다
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // 3.
  // deep copy1 // 생성자
  factory Book.clone(Book book) {
    return Book(
        title: book.title,
        comment: book.comment,
        publishDate: book.publishDate);
  }

  // deep copy2 // 일반 메서드
  Book copyWith({String? title, String? comment, DateTime? publishDate}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate}';
  }
}

void main() {
  final List<Book> books1 = [
    Book(title: 'aaa', comment: 'aaaaa', publishDate: DateTime(1967, 1, 24)),
    Book(title: 'aaa', comment: 'bbb', publishDate: DateTime(1973, 4, 26)),
    Book(title: 'aaa', comment: 'aaaaa', publishDate: DateTime(2004, 4, 2)),
    Book(title: 'aaa', comment: 'aaaaa', publishDate: DateTime(2005, 6, 10)),
  ];

  final Set<Book> books2 = {
    Book(title: 'bbb', comment: 'aaaaa', publishDate: DateTime(1973, 4, 26)),
    Book(title: 'aaa', comment: 'bbb', publishDate: DateTime(1967, 1, 24)),
    Book(title: 'aaa', comment: 'aaaaa', publishDate: DateTime(2004, 4, 2)),
    Book(title: 'aaa', comment: 'aaaaa', publishDate: DateTime(2005, 6, 10)),
  };

  final Map<Book, dynamic> books3 = {
    Book(
      title: 'c',
      comment: 'cab',
      publishDate: DateTime(2004, 4, 2),
    ): 'April',
    Book(
      title: 'aaa',
      comment: 'bbb',
      publishDate: DateTime(1967, 1, 24),
    ): 'January',
    Book(
      title: 'bbb',
      comment: 'aaaaa',
      publishDate: DateTime(1973, 4, 26),
    ): 'April',
    Book(
      title: 'aaa',
      comment: 'aaaaa',
      publishDate: DateTime(2005, 6, 10),
    ): 'June',
  };

  // final Book book1 =
  //     Book(title: 'bbb', comment: 'bbbbb', publishDate: DateTime(1973, 4, 26));

  // 1.
  // List 동일 객체 test - true
  // books1.sort((a, b) => a.title.compareTo(b.title));
  // print(books1);

  // Set 동일 객체 test - true
  // print(books2.contains(book1));

  // Map 동일 객체 test - false, dynamic으로 추가한 타입 때문에 false
  // print(books3.hashCode);
  // print(book1.hashCode);

  // 2. 정렬하기
  // List
  // List deep copy
  // final otherBook = [];
  books1.sort((a, b) => a.publishDate.compareTo(b.publishDate));
  for (var book in books1) {
    '$book\n'.toString();
    // otherBook.add(book.copyWith());
  }

  // Set
  final listSet = books2.toList()
    ..sort((a, b) => a.publishDate.compareTo(b.publishDate));
  listSet.forEach((book) {
    book.toString();
  });
  print('\n');

  // Map
  final listMap = books3.keys.toList()
    ..sort((a, b) => a.publishDate.compareTo(b.publishDate));
  listMap.forEach((book) {
    book.toString();
  });

  Book book1 = Book(
    title: 'a',
    comment: 'b',
    publishDate: DateTime(2020, 1, 2),
  );

  Book book2 = Book.clone(book1); // 복사
  book2.title = 'b';

  print(book1.title);
  print(book2.title);
}

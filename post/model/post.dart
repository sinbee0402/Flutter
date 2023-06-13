class Post {
  int id;
  String title;
  String body;

  Post(this.id, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

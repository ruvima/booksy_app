import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String coverUrl;
  const Book(
    this.id,
    this.title,
    this.author,
    this.description,
    this.coverUrl,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'coverUrl': coverUrl,
    };
  }

  Book.fromJson(String id, Map<String, dynamic> json)
      : this(
          id,
          json['name'] as String,
          json['author'] as String,
          json['summary'] as String,
          json.containsKey('coverUrl')
              ? json['coverUrl'] as String
              : 'assets/images/empty.jpg',
        );

  toJson() {
    //TODO
    throw UnimplementedError();
  }

  // factory Book.fromMap(Map<String, dynamic> map) {
  //   return Book(
  //     id: map['id'],
  //     title: map['name'],
  //     author: map['author'],
  //     description: map['description'],
  //     coverUrl: map['coverUrl'],
  //   );
  // }
  // String toJson() => json.encode(toMap());

  // factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}

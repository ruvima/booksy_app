// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final int id;
  final String title;
  final String author;
  final String description;
  final String coverUrl;
  Book({
    this.id = 0,
    this.title = '',
    this.author = '',
    this.description = '',
    required this.coverUrl,
  });
}

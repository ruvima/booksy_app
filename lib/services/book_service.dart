import 'package:booksy_app/model/book.dart';

class BookService {
  static const List<Book> books = [
    Book(
      id: 1,
      title: 'El hombre en busca de sentido',
      author: 'Viktor E. Frankl',
      description:
          'El hombre en busca de sentido es el estremecedor relato en el que Viktor Frankl nos narra su experiencia en los campos de concentración.',
      coverUrl: 'assets/images/book1.jpg',
    ),
    Book(
      id: 2,
      title:
          'ELos 5 lenguajes del amor (edición en español): El Secreto del Amor Que Perdura',
      author: 'Gary Chapman',
      description:
          'Actualizado para reflejar las complejidades de la relaciones hoy en día, esta edición enseña verdades esenciales que realmente dan resultado; además, presenta consejos sabios y prácticos para restaurar relaciones.',
      coverUrl: 'assets/images/book2.jpg',
    ),
  ];

  Future<List<Book>> getLastBook() async {
    // return Future.value(books.sublist(0, 2));
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books.sublist(0, 2)));
  }

  Future<Book> getBook(int bookId) async {
    // return Future.value(books.sublist(0, 2));
    return Future.delayed(const Duration(seconds: 2)).then((value) =>
        Future.value(
            books.firstWhere((bookElement) => bookElement.id == bookId)));
  }
}

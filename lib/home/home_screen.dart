import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Book> _books = const [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: _books.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const HeaderWidget();
          }
          if (index == 1) {
            return const ListItemHeader();
          }
          return ListItemBook(_books[index - 2]);
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/header.jpg'));
  }
}

class ListItemHeader extends StatelessWidget {
  const ListItemHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5),
      child: const Text(
        'Ultimos Libros',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ListItemBook extends StatelessWidget {
  const ListItemBook(
    this._book, {
    Key? key,
  }) : super(key: key);

  final Book _book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _openBookDetails(context, _book) {}
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(_book.coverUrl),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _book.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _book.author,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _book.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBookDetails(BuildContext context, Book book2) {}
}

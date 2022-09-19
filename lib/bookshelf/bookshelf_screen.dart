import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);
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
      title: 'Muchas vidas, muchos maestros',
      author: 'Brian Weiss',
      description:
          'Actualizado para reflejar las complejidades de la relaciones hoy en día, esta edición enseña verdades esenciales que realmente dan resultado; además, presenta consejos sabios y prácticos para restaurar relaciones.',
      coverUrl: 'assets/images/book2.jpg',
    ),
    Book(
      id: 3,
      title:
          'ELos 5 lenguajes del amor (edición en español): El Secreto del Amor Que Perdura',
      author: 'Gary Chapman',
      description:
          'En éste, Brian Weiss nos cuenta la asombrosa experiencia que cambió su vida para siempre, en una obra maestra de la espiritualidad que sigue siendo de lectura obligada.',
      coverUrl: 'assets/images/book3.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    if (_books.isEmpty) {
      return Center(
        child: Text(
          'Aún no tienes ningún libro en tu estante',
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return BookCoverItem(_books[index]);
        },
      ),
    );
  }
}

class BookCoverItem extends StatelessWidget {
  const BookCoverItem(
    this._book, {
    Key? key,
  }) : super(key: key);
  final Book _book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink.image(
        image: AssetImage(_book.coverUrl),
        fit: BoxFit.fill,
      ),
    );
  }
}

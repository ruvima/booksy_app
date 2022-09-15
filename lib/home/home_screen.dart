import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Book> _books = [
    Book(
      id: 1,
      title: 'Essentialism: The disciplined pursuit of less ',
      author: 'Greg Mckeown',
      description:
          'The Way of the Essentialist isn\'t about getting more done in less time. It\'s not about getting less done. It\'s about getting only the right things done. ',
    ),
    Book(
      id: 2,
      title: 'Einstein: His Life and Universe',
      author: 'Walter Isaacson',
      description:
          'Einstein was a rebel and nonconformist from boyhood days, and these character traits drove both his life and his science. In this narrative, Walter Isaacson explains how his mind worked and the mysteries of the universe that he discovered.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _books.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(_books[index].title);
      },
    );
  }
}

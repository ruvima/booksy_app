import 'package:booksy_app/model/book.dart';
import 'package:booksy_app/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen(this._book, {Key? key}) : super(key: key);

  final Book _book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Libro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverWidget(_book.coverUrl),
            BookInfoWidget(_book.title, _book.author, _book.description),
            BookActionsWidget(_book.id),
          ],
        ),
      ),
    );
  }
}

class BookActionsWidget extends StatelessWidget {
  const BookActionsWidget(
    this.bookId, {
    Key? key,
  }) : super(key: key);
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
      builder: (context, bookshelfState) {
        var action = () => _addToBookshelf(context, bookId);
        var label = 'Agregar a Mi Estante';
        var color = Colors.green;

        if (bookshelfState.bookIds.contains(bookId)) {
          action = () => _removeToBookshelf(context, bookId);
          label = 'Quitar de Mi Estante';
          color = Colors.amber;
        }

        return ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Text(label),
        );
      },
    );
  }

  void _addToBookshelf(BuildContext context, String bookId) {
    var bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(AddBookToBookShelf(bookId));
  }

  void _removeToBookshelf(BuildContext context, String bookId) {
    var bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(RemoveBookToBookShelf(bookId));
  }
}

class BookInfoWidget extends StatelessWidget {
  const BookInfoWidget(
    this.title,
    this.author,
    this.description, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String author;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            author,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          Text(description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  const BookCoverWidget(
    this._coverUrl, {
    Key? key,
  }) : super(key: key);

  final String _coverUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: 230,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20),
        ],
      ),
      child: Image.asset(_coverUrl),
    );
  }
}

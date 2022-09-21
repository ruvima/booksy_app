import 'package:booksy_app/book_details/book_details_screen.dart';
import 'package:booksy_app/model/book.dart';
import 'package:booksy_app/services/book_service.dart';
import 'package:booksy_app/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
      builder: (context, bookshelfState) {
        if (bookshelfState.bookIds.isEmpty) {
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
            itemCount: bookshelfState.bookIds.length,
            itemBuilder: (context, index) {
              return BookCoverItem(bookshelfState.bookIds[index]);
            },
          ),
        );
      },
    );
  }
}

class BookCoverItem extends StatefulWidget {
  const BookCoverItem(
    this._bookId, {
    Key? key,
  }) : super(key: key);
  final String _bookId;

  @override
  State<BookCoverItem> createState() => _BookCoverItemState();
}

class _BookCoverItemState extends State<BookCoverItem> {
  Book? _book;

  @override
  void initState() {
    _getBook(widget._bookId);
    super.initState();
  }

  void _getBook(String bookId) async {
    var book = await BookService().getBook(bookId);
    setState(() {
      _book = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_book == null) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    return InkWell(
      onTap: () {
        _openBookDetails(_book!, context);
      },
      child: Ink.image(
        image: AssetImage(_book!.coverUrl),
        fit: BoxFit.fill,
      ),
    );
  }

  _openBookDetails(Book book, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book),
      ),
    );
  }
}

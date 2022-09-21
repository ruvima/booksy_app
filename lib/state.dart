import 'package:flutter_bloc/flutter_bloc.dart';

class BookshelfState {
  List<int> bookIds;
  BookshelfState(this.bookIds);
}

abstract class BookshelftEvent {
  const BookshelftEvent();
}

class AddBookToBookShelf extends BookshelftEvent {
  final int bookId;
  const AddBookToBookShelf(this.bookId);
}

class RemoveBookToBookShelf extends BookshelftEvent {
  final int bookId;
  const RemoveBookToBookShelf(this.bookId);
}

class BookshelfBloc extends Bloc<BookshelftEvent, BookshelfState> {
  BookshelfBloc(BookshelfState initialState) : super(initialState) {
    on<AddBookToBookShelf>(
      (event, emit) {
        state.bookIds.add(event.bookId);
        emit(BookshelfState(state.bookIds));
      },
    );
    on<RemoveBookToBookShelf>(
      (event, emit) {
        state.bookIds.remove(event.bookId);
        emit(BookshelfState(state.bookIds));
      },
    );
  }
}

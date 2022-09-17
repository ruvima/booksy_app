import 'package:booksy_app/model/book_category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BookCategoriesGrid();
  }
}

class BookCategoriesGrid extends StatelessWidget {
  BookCategoriesGrid({Key? key}) : super(key: key);

  final List<BookCategory> _categories = [
    BookCategory(1, 'Ciencia Ficción'),
    BookCategory(2, 'Aventura'),
    BookCategory(3, 'Filosofia'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _categories.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Text('Categoria');
      },
    );
  }
}

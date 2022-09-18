import 'package:booksy_app/model/book_category.dart';
import 'package:booksy_app/utils.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookCategoriesGrid();
  }
}

class BookCategoriesGrid extends StatelessWidget {
  const BookCategoriesGrid({Key? key}) : super(key: key);

  final List<BookCategory> _categories = const [
    BookCategory(1, 'Ciencia Ficción', '#A9CCE3'),
    BookCategory(2, 'Aventura', '#C5FBD3'),
    BookCategory(3, 'Filosofia', '#F0B3E1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TitleCategory(_categories[index]);
        },
      ),
    );
  }
}

class TitleCategory extends StatelessWidget {
  const TitleCategory(
    this._category, {
    Key? key,
  }) : super(key: key);
  final BookCategory _category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          _navigateToBooksWithCategory();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: hexToColor(_category.colorBg),
          ),
          alignment: Alignment.center,
          child: Text(
            _category.name,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _navigateToBooksWithCategory() {}
}

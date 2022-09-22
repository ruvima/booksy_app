import 'package:booksy_app/services/book_service.dart';
import 'package:booksy_app/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo libro'),
      ),
      body: AddBookForm(),
    );
  }
}

class AddBookForm extends StatefulWidget {
  const AddBookForm({Key? key}) : super(key: key);

  @override
  State<AddBookForm> createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final titleFieldController = TextEditingController();
  final authorFieldController = TextEditingController();
  final summaryFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _savingBook = false;

  @override
  Widget build(BuildContext context) {
    if (_savingBook) {
      return const Center(child: CircularProgressIndicator());
    }
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextFormField(
            controller: titleFieldController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Titulo',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa el titulo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: authorFieldController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Autor',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa el autor';
              }
              return null;
            },
          ),
          TextFormField(
            controller: summaryFieldController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Resumen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _saveBook(context);
              }
            },
            child: const Text('Guardar'),
          ),
        ]),
      ),
    );
  }

  void _saveBook(BuildContext context) async {
    var title = titleFieldController.text;
    var author = authorFieldController.text;
    var summary = summaryFieldController.text;

    setState(() {
      _savingBook = true;
    });
    var newBookId = await BookService().saveBook(title, author, summary);
    var bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(AddBookToBookShelf(newBookId));

    Navigator.pop(context);
  }
}

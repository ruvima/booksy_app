import 'package:booksy_app/categories/categories_screen.dart';
import 'package:booksy_app/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BooksyApp());

class BooksyApp extends StatelessWidget {
  const BooksyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  static final List<Widget> _sections = [
    HomeScreen(),
    CategoriesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booksy'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: 'Bibliotecaa',
          ),
        ],
      ),
      body: _sections[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

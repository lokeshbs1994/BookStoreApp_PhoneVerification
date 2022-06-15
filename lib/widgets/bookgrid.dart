import 'package:phone_verification/providers/books.dart';
import 'package:phone_verification/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    final books = booksData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemCount: books.length,
      itemBuilder: (BuildContext context, int i) =>
          ChangeNotifierProvider.value(
        value: books[i],
        child: BookItem(),
      ),
    );
  }
}

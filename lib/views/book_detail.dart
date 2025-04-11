import 'package:flutter/material.dart';
import 'package:materi_getx/models/book_model.dart';

class BookDetail extends StatelessWidget {
  final BookModel book;
  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Title: ${book.title}'),
            SizedBox(height: 8),
            Text('Author: ${book.author}'),
            SizedBox(height: 8),
            Text('Publisher: ${book.publisher}'),
            SizedBox(height: 8),
            Text('Year: ${book.year}'),
            SizedBox(height: 8),
            Text('Page Count: ${book.pageCount}'),
            SizedBox(height: 8),
            Text('Read Page: ${book.readPage}'),
            SizedBox(height: 8),
            Text('Finished: ${book.isFinished! ? 'Yes' : 'No'}'),
            SizedBox(height: 8),
            Text('Summary: ${book.summary}'),
            SizedBox(height: 8),
            Text('Created At: ${book.createdAt}'),
            SizedBox(height: 8),
            Text('Updated At: ${book.updatedAt}'),
          ],
        ),
      ),
    );
  }
}

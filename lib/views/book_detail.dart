import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';

class Other extends StatelessWidget {
  const Other({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    final book = controller.selectedBook.value;

    return Scaffold(
      appBar: AppBar(title: Text(book?.title ?? 'No Title')),
      body: book == null
          ? Center(child: Text('No Book Selected'))
          : Padding(
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
                  Text('Finished: ${book.isFinished ? 'Yes' : 'No'}'),
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

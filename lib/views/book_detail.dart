import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controllers/book_controller.dart';
import 'package:materi_getx/models/book_model.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final BookModel book = controller.book.value!;
      return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: () => controller.fetchBookById(book.id!),
                icon: Icon(Icons.refresh),
              ),
            )
          ],
        ),
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
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controllers/book_controller.dart';
import 'package:materi_getx/views/book_detail.dart';
import 'package:materi_getx/views/book_form.dart';
import 'package:materi_getx/widgets/book_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: controller.fetchBooks,
              icon: Icon(Icons.refresh),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue[100],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.info_outline, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Untung menghapus, geser item ke arah kiri.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.bookList.length,
                itemBuilder: (context, index) {
                  final book = controller.bookList[index];
                  return BookTile(
                    book: book,
                    onTap: () {
                      controller.book.value = book;
                      Get.to(() => BookDetail());
                    },
                    onEdit: () {
                      Get.to(() => BookFormPage(book: book));
                    },
                    onDismissed: (direction) {
                      controller.deleteBook(book.id!);
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => BookFormPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

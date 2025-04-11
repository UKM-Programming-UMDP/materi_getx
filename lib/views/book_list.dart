import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';
import 'package:materi_getx/views/book_detail.dart';
import 'package:materi_getx/views/book_form.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
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
        return ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                controller.selectBook(book);
                Get.to(() => Other());
              },
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  controller.selectBook(book);
                  Get.to(() => BookFormPage(book: book));
                },
              ),
            );
          },
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

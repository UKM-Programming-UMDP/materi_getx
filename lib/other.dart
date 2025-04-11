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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(book?.author ?? 'No Author'),
      ),
    );
  }
}

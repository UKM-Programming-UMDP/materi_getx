import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';
import 'package:materi_getx/other.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Other"),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

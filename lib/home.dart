import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';
import 'package:materi_getx/other.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error}'));
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return ListTile(
              leading: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 100);
                      },
                    )
                  : const Icon(Icons.image_not_supported, size: 100),
              title: Text(article.title ?? 'No Title'),
              subtitle: Text(article.description ?? 'No Description'),
              onTap: () {
                controller.selectArticle(article);
                Get.to(() => Other());
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

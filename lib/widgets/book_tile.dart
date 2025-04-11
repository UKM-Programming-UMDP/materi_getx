import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/models/book_model.dart';

class BookTile extends StatelessWidget {
  final BookModel book;
  final void Function()? onTap;
  final void Function()? onEdit;
  final void Function(DismissDirection)? onDismissed;

  const BookTile({
    super.key,
    required this.book,
    this.onTap,
    this.onEdit,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(book.id!),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 32),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await Get.dialog<bool>(
          AlertDialog(
            title: const Text('Delete Book'),
            content: Text('Are you sure you want to delete \n${book.title}?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      onDismissed: onDismissed,
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
        onTap: onTap,
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEdit,
        ),
      ),
    );
  }
}

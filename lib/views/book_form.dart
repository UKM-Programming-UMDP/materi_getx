import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controllers/book_controller.dart';
import 'package:materi_getx/models/book_model.dart';
import 'package:materi_getx/utils/validator.dart';

class BookFormPage extends StatefulWidget {
  final BookModel? book;

  const BookFormPage({super.key, this.book});

  @override
  State<BookFormPage> createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<BookController>();

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _summaryController = TextEditingController();
  final _yearController = TextEditingController();
  final _totalPageController = TextEditingController();
  final _readPageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final book = widget.book;
    if (book != null) {
      _titleController.text = book.title;
      _authorController.text = book.author;
      _publisherController.text = book.publisher;
      _summaryController.text = book.summary;
      _yearController.text = book.year.toString();
      _totalPageController.text = book.pageCount.toString();
      _readPageController.text = book.readPage.toString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _summaryController.dispose();
    _yearController.dispose();
    _totalPageController.dispose();
    _readPageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final book = BookModel(
      title: _titleController.text,
      year: int.parse(_yearController.text),
      author: _authorController.text,
      summary: _summaryController.text,
      publisher: _publisherController.text,
      pageCount: int.parse(_totalPageController.text),
      readPage: int.parse(_readPageController.text),
    );

    if (widget.book == null) {
      controller.addBook(book);
    } else {
      controller.updateBook(widget.book!.id!, book);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.book != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Book' : 'Add Book')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _publisherController,
                decoration: InputDecoration(labelText: 'Publisher'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(labelText: 'Summary'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Year'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _totalPageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Total Pages'),
                validator: emptyValidator,
              ),
              TextFormField(
                controller: _readPageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Read Pages'),
                validator: emptyValidator,
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(isEdit ? 'Update Book' : 'Add Book'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

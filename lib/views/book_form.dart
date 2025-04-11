import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';
import 'package:materi_getx/models/book_model.dart';

class BookFormPage extends StatefulWidget {
  final BookModel? book;

  const BookFormPage({super.key, this.book});

  @override
  State<BookFormPage> createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(Controller());

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _summaryController = TextEditingController();
  final _yearController = TextEditingController();
  final _totalPageController = TextEditingController();
  final _readPageController = TextEditingController();

  bool _isFinished = false;

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
      _isFinished = book.isFinished;
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
    final book = BookModel(
      id: widget.book?.id ?? '',
      title: _titleController.text,
      year: int.parse(_yearController.text),
      author: _authorController.text,
      summary: _summaryController.text,
      publisher: _publisherController.text,
      pageCount: int.parse(_totalPageController.text),
      readPage: int.parse(_readPageController.text),
      isFinished: _isFinished,
      createdAt: widget.book?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
    print('Submiting..');

    if (widget.book == null) {
      print('Adding book..');
      controller.addBook(book);
    } else {
      print('Update book..');
      controller.updateBook(widget.book!.id, book);
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
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
              TextFormField(
                controller: _publisherController,
                decoration: InputDecoration(labelText: 'Publisher'),
              ),
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(labelText: 'Summary'),
              ),
              TextFormField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Year'),
              ),
              TextFormField(
                controller: _totalPageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Total Pages'),
              ),
              TextFormField(
                controller: _readPageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Read Pages'),
              ),
              SwitchListTile(
                title: const Text('Finished'),
                value: _isFinished,
                onChanged: (val) => setState(() => _isFinished = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(isEdit ? 'Update Book' : 'Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:materi_getx/models/book_model.dart';
import 'package:materi_getx/services/book_service.dart';

class Controller extends GetxController {
  final BookService _bookService = BookService();

  var books = <BookModel>[].obs;
  var selectedBook = Rxn<BookModel>();

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() async {
    try {
      final fetchedBooks = await _bookService.getAllBooks();
      books.value = fetchedBooks;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void selectBook(BookModel book) {
    selectedBook.value = book;
  }

  Future<void> addBook(BookModel book) async {
    try {
      await _bookService.addBook(book);
      Get.snackbar('Success', 'Book added');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> updateBook(String id, BookModel book) async {
    try {
      await _bookService.updateBook(id, book);
      Get.snackbar('Success', 'Book updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteBook(String id) async {
    try {
      await _bookService.deleteBook(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

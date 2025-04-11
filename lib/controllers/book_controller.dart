import 'package:get/get.dart';
import 'package:materi_getx/models/book_model.dart';
import 'package:materi_getx/services/book_service.dart';

class BookController extends GetxController {
  final BookService _bookService = BookService();

  var isLoading = false.obs;

  var bookList = <BookModel>[].obs;
  var book = Rxn<BookModel>();

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading.value = true;
      final fetchedBookList = await _bookService.getAllBooks();
      bookList.value = fetchedBookList;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  Future<void> fetchBookById(String id) async {
    try {
      isLoading.value = true;
      final fetchedBook = await _bookService.getBookById(id);
      book.value = fetchedBook;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  void addBook(BookModel book) async {
    try {
      isLoading.value = true;
      await _bookService.addBook(book);
      await fetchBooks();
      Get.back();
      Get.snackbar(
        'Success',
        'Book added',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  Future<void> updateBook(String id, BookModel book) async {
    try {
      isLoading.value = true;
      await _bookService.updateBook(id, book);
      await fetchBooks();
      Get.back();
      Get.snackbar(
        'Success',
        'Book updated',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  void deleteBook(String id) async {
    try {
      await _bookService.deleteBook(id);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

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
      print(e.toString());
    }
  }

  void selectBook(BookModel book) {
    selectedBook.value = book;
  }
}

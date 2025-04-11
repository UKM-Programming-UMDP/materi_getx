import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:materi_getx/models/book_model.dart';

class BookService {
  static const String baseUrl = 'https://rendyp-book-api.vercel.app';

  Future<List<BookModel>> getAllBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/books'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return (result['data'] as List)
          .map((e) => BookModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<BookModel> getBookById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/books/$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return BookModel.fromJson(jsonData['data']['book']);
    } else {
      throw Exception('Book not found');
    }
  }

  Future<void> addBook(BookModel book) async {
    final response = await http.post(
      Uri.parse('$baseUrl/books'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(book.createBook()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add book');
    }
  }

  Future<void> updateBook(String id, BookModel book) async {
    final response = await http.put(
      Uri.parse('$baseUrl/books/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(book.updateBook()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/books/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }
}

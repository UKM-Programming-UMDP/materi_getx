class BookResponse {
  final String status;
  final List<BookModel> data;

  BookResponse({
    required this.status,
    required this.data,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      status: json['status'],
      data: List<BookModel>.from(
        json['data'].map((book) => BookModel.fromJson(book)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((book) => book.toJson()).toList(),
    };
  }
}

class BookModel {
  final String id;
  final String title;
  final int year;
  final String author;
  final String summary;
  final String publisher;
  final int pageCount;
  final int readPage;
  final bool isFinished;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookModel({
    required this.id,
    required this.title,
    required this.year,
    required this.author,
    required this.summary,
    required this.publisher,
    required this.pageCount,
    required this.readPage,
    required this.isFinished,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      author: json['author'],
      summary: json['summary'],
      publisher: json['publisher'],
      pageCount: json['pageCount'],
      readPage: json['readPage'],
      isFinished: json['isFinished'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'author': author,
      'summary': summary,
      'publisher': publisher,
      'pageCount': pageCount,
      'readPage': readPage,
      'isFinished': isFinished,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

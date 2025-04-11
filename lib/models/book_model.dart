class BookModel {
  final String? id;
  final String title;
  final int year;
  final String author;
  final String summary;
  final String publisher;
  final int pageCount;
  final int readPage;
  final bool? isFinished;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BookModel({
    this.id,
    required this.title,
    required this.year,
    required this.author,
    required this.summary,
    required this.publisher,
    required this.pageCount,
    required this.readPage,
    this.isFinished,
    this.createdAt,
    this.updatedAt,
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

  Map<String, dynamic> createBook() {
    return {
      'title': title,
      'year': year,
      'author': author,
      'summary': summary,
      'publisher': publisher,
      'pageCount': pageCount,
      'readPage': readPage,
    };
  }

  Map<String, dynamic> updateBook() {
    return {
      'title': title,
      'year': year,
      'author': author,
      'summary': summary,
      'publisher': publisher,
      'pageCount': pageCount,
      'readPage': readPage,
    };
  }
}

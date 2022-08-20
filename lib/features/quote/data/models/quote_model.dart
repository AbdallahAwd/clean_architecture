import '../../domain/entities/quote.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel(
      {int? status, String? message, int? count, List<Quotes>? quotes})
      : super(status: status, message: message, count: count, quotes: quotes);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        count: json['count'] as int?,
        quotes: (json['quotes'] as List<dynamic>?)
            ?.map((e) => Quotes.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Quotes {
  String? text;
  String? author;
  String? tag;

  Quotes({this.text, this.author, this.tag});

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        text: json['text'] as String?,
        author: json['author'] as String?,
        tag: json['tag'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'author': author,
        'tag': tag,
      };
}

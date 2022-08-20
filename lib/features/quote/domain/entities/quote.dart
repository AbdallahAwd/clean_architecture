import 'package:equatable/equatable.dart';

import '../../data/models/quote_model.dart';

class QuoteEntity extends Equatable {
  final int? status;
  final String? message;
  final int? count;
  final List<Quotes>? quotes;

  const QuoteEntity({this.status, this.message, this.count, this.quotes});

  @override
  List<Object?> get props => [status, message, count, quotes];
}

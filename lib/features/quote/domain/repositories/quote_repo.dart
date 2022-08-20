import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/quote.dart';

abstract class QuoteRepository {
  // Future<Either<Failure, Unit>> getQuote(); // Unit if there is no return value
  Future<Either<Failure, QuoteEntity>> getQuote();
}

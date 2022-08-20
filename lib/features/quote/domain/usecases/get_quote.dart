import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quote_repo.dart';

class GetQuote implements UseCase<QuoteEntity, NoParams> {
  final QuoteRepository repository;

  GetQuote(this.repository);

  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) {
    return repository.getQuote();
  }
}

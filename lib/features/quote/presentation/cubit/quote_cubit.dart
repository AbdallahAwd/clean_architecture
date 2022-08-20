import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetQuote getQuotes;
  QuoteCubit(this.getQuotes) : super(QuoteInitial());
  // static QuoteCubit get(context) => BlocProvider.of(context);

  Future<void> getQuote() async {
    emit(QuoteIsLoading());
    Either<Failure, QuoteEntity> response = await getQuotes(NoParams());
    emit(response.fold(
      (failure) => QuoteIsLoadingError(error: failure.toString()),
      (quote) => QuoteIsLoaded(quote: quote),
    ));
  }
}

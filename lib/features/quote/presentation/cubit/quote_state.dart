part of 'quote_cubit.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteIsLoading extends QuoteState {}

class QuoteIsLoaded extends QuoteState {
  final QuoteEntity quote;
  const QuoteIsLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class QuoteIsLoadingError extends QuoteState {
  final String error;
  const QuoteIsLoadingError({required this.error});
  @override
  List<Object> get props => [error];
}

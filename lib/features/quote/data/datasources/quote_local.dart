import 'dart:convert';

import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/core/resources/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quote_model.dart';

abstract class QuoteLocalDataSource {
  Future<QuoteModel> getLastQuote();
  Future<void> cacheQuote(QuoteModel model);
}

class QuoteLocalDataSourceImp implements QuoteLocalDataSource {
  final SharedPreferences _sharedPreferences;

  QuoteLocalDataSourceImp(this._sharedPreferences);

  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    await _sharedPreferences.setString(
      AppStrings.getQuoteKey,
      json.encode(quote.quotes![0]),
    );
  }

  @override
  Future<QuoteModel> getLastQuote() async {
    final getLastQuote = _sharedPreferences.getString(AppStrings.getQuoteKey);
    if (getLastQuote != null) {
      QuoteModel quote =
          await Future.value(QuoteModel.fromJson(json.decode(getLastQuote)));
      return quote;
    } else {
      throw CacheFailure();
    }
  }
}

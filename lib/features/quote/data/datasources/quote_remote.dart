import 'dart:convert';

import 'package:clean_arch/core/api/endpoint.dart';

import '../models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getQuote();
}

class QuoteRemoteDataSourceImp implements QuoteRemoteDataSource {
  final http.Client client;
  QuoteRemoteDataSourceImp({required this.client});
  @override
  Future<QuoteModel> getQuote() async {
    final http.Response response =
        await client.get(Uri.parse(EndPoint.QUOTE_URL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}

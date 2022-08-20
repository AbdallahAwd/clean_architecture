import 'package:clean_arch/core/error/exeption.dart';
import 'package:clean_arch/core/network/network.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch/features/quote/domain/entities/quote.dart';

import 'package:clean_arch/core/error/failures.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/quote_repo.dart';
import '../datasources/quote_local.dart';
import '../datasources/quote_remote.dart';

class QuoteRepo implements QuoteRepository {
  final Network network;
  final QuoteLocalDataSource localDataSource;
  final QuoteRemoteDataSource remoteDataSource;

  QuoteRepo({
    required this.network,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, QuoteEntity>> getQuote() async {
    if (await network.isConnected) {
      try {
        debugPrint('Remote Data Source');
        final quoteRemote = await remoteDataSource.getQuote();
        localDataSource.cacheQuote(quoteRemote);
        return Right(quoteRemote);
      } on ServerException {
        return Left(ServerFailure('error'));
      }
    } else {
      debugPrint('Local Data Source');
      try {
        final quoteLocal = await localDataSource.getLastQuote();
        return Right(quoteLocal);
      } catch (e) {
        return Left(ServerFailure('error'));
      }
    }
    // if (await network.isConnected) {

    // } else {

    // }
  }
}

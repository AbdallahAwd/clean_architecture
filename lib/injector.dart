import 'package:clean_arch/core/api/app_interceptor.dart';
import 'package:clean_arch/core/network/network.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/quote/data/datasources/quote_local.dart';
import 'features/quote/data/datasources/quote_remote.dart';
import 'features/quote/data/repositories/quote_repo.dart';
import 'features/quote/domain/repositories/quote_repo.dart';
import 'features/quote/domain/usecases/get_quote.dart';
import 'features/quote/presentation/cubit/quote_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //bloc
  sl.registerFactory(() => QuoteCubit(sl()));
  //usecase
  sl.registerLazySingleton(() => GetQuote(sl()));
  //repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepo(
        localDataSource: sl(),
        network: sl(),
        remoteDataSource: sl(),
      ));
  //data sources
  sl.registerLazySingleton<QuoteLocalDataSource>(() => QuoteLocalDataSourceImp(
        sl(),
      ));
  sl.registerLazySingleton<QuoteRemoteDataSource>(
      () => QuoteRemoteDataSourceImp(
            client: sl(),
          ));
  //! Core
  sl.registerLazySingleton<Network>(() => NetworkImp(
        internetConnectionChecker: sl(),
      ));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() => LogInterceptor(
        responseBody: true,
        requestBody: true,
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

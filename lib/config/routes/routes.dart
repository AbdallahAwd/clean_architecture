import 'package:clean_arch/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/quote/presentation/pages/home.dart';
import 'package:clean_arch/injector.dart' as di;

class Routes {
  static const String home = '/';
  static const String fav = '/fav';
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<QuoteCubit>(),
                  child: const Home(),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

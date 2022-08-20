import 'package:clean_arch/core/resources/app_strings.dart';
import 'package:clean_arch/core/resources/mediaquary.dart';
import 'package:clean_arch/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:clean_arch/features/quote/presentation/widgets/quote_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _getRandomQuote() async =>
      await BlocProvider.of<QuoteCubit>(context).getQuote();
  @override
  void initState() {
    _getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.title),
        ),
        body: BlocBuilder<QuoteCubit, QuoteState>(
          builder: (context, state) {
            if (state is QuoteIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is QuoteIsLoaded) {
              return Column(
                children: <Widget>[
                  QuoteBuilder(quote: state.quote),
                  SizedBox(
                    height: context.height / 8,
                  ),
                  Refresh(
                    onPressed: () {
                      _getRandomQuote();
                      debugPrint('Refreshed');
                    },
                  )
                ],
              );
            } else if (state is QuoteIsLoadingError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(
                child: Text('Not Expected State'),
              );
            }
          },
        ));
  }
}

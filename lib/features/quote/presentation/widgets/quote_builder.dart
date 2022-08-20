import 'package:clean_arch/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/quote.dart';

class QuoteBuilder extends StatelessWidget {
  final QuoteEntity quote;
  const QuoteBuilder({Key? key, required this.quote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: AppColors.DEFAULT_COLOR,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Column(
          children: [
            Text(quote.quotes![0].text!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 15,
            ),
            Text(quote.quotes![0].author!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

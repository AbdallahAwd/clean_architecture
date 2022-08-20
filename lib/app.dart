import 'package:clean_arch/config/routes/routes.dart';
import 'package:clean_arch/core/resources/app_colors.dart';
import 'package:clean_arch/core/resources/app_strings.dart';
import 'package:flutter/material.dart';

import 'config/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.title,
      color: AppColors.DEFAULT_COLOR,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

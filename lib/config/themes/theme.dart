import 'package:clean_arch/core/resources/app_strings.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: AppColors.DEFAULT_COLOR,
      fontFamily: AppStrings.fontName,
      appBarTheme: AppBarTheme(
          elevation: 0.0, centerTitle: true, color: AppColors.DEFAULT_COLOR),
    );

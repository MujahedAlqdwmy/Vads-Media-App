import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

AppBar customAppBar(String title) {
  return AppBar(
    foregroundColor: AppColors.white,
    centerTitle: true,
    backgroundColor: AppColors.darkPageBackgroundColor,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        color: AppColors.white,
      ),
    ),
  );
}

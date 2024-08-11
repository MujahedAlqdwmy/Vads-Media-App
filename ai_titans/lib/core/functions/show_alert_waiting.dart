import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertWaiting() {
  Get.defaultDialog(
    title: "It takes few moments....",
    titlePadding: const EdgeInsets.only(top: 20),
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    content: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}

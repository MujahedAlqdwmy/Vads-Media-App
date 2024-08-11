import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';

class BoxTitle extends StatelessWidget {
  const BoxTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 5.5,
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        width: Get.width - 32,
        height: 65,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ai Titens",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "We go to another level",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

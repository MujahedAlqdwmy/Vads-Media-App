import 'package:ai_titans/controllers/questions_screen_controller.dart';
import 'package:ai_titans/view/widgets/grid_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/box_title.dart';
import '../widgets/image_slider.dart';
import '../widgets/script_field_widget.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsScreenControllerImp());
    return Scaffold(
      body: GetBuilder<QuestionsScreenControllerImp>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ImageSlider(imageUrls: controller.imageUrls),
                    const BoxTitle(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Questions",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: controller.gridItems.length * 20,
                        child: const GridViewCards(),
                      ),
                      const SizedBox(height: 10),
                      const ScriptFieldWidget()
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:ai_titans/controllers/questions_screen_controller.dart';
import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/view/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewCards extends StatelessWidget {
  const GridViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsScreenControllerImp>(
      builder: (controller) {
        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            controller.gridItems.length,
            (i) => InkWell(
              onTap: controller.gridItems[i].onTap,
              child: CardWidget(
                icon: controller.gridItems[i].icon,
                text: controller.gridItems[i].text,
                isAnswerd: controller.gridItems[i].isAnswerd,
                colorGradiant1: i % 2 == 0
                    ? AppColors.primaryColor.withAlpha(150)
                    : AppColors.secondaryColor.withAlpha(150),
                colorGradiant2: i % 2 == 0
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

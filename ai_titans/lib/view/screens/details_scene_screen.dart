import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/data/models/scene_image_model.dart';
import 'package:ai_titans/view/widgets/custom_app_bar.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/generate_scenes_screen_controller.dart';

class DetailsSceneScreen extends StatelessWidget {
  const DetailsSceneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SceneImage s = Get.arguments['scene'] as SceneImage;
    final String imageUrl = s.imageUrl;
    final int index = Get.arguments['index'] as int;
    return Scaffold(
      appBar: customAppBar('Scene Details'),
      body:
          GetBuilder<GenerateScenesScreenControllerImp>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    s.printText(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  text: 'ReGenerat this image',
                  onPressed: () {
                    controller.reGenerateOneImageSceneInDetails(s, index);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

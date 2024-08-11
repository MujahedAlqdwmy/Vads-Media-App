import 'package:ai_titans/core/constants/app_rout.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/generate_scenes_screen_controller.dart';
import '../widgets/card_image_widget.dart';
import '../widgets/custom_app_bar.dart';

class GenerateScenesWithImagesScreen extends StatelessWidget {
  const GenerateScenesWithImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GenerateScenesScreenControllerImp());
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(AppRoute.questionsScreen);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: customAppBar('Generate Scenes'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GetBuilder<GenerateScenesScreenControllerImp>(
                builder: (controller) {
              return Column(
                children: [
                  SizedBox(
                    height: controller.scenesImages.length * 237,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.scenesImages.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.showDetails(
                              controller.scenesImages[index],
                              index,
                            );
                          },
                          child: CardImageWidget(
                            sceneImage: controller.scenesImages[index],
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Continue',
                    onPressed: () {
                      controller.generateVideo();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

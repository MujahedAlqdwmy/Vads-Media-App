import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/generate_scenes_screen_controller.dart';
import '../../data/models/scene_image_model.dart';

class CardImageWidget extends StatelessWidget {
  final SceneImage sceneImage;
  final int index;

  const CardImageWidget({
    super.key,
    required this.sceneImage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateScenesScreenControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            Card(
              color: AppColors.darkBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(sceneImage.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        sceneImage.printText(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 175,
                height: 40,
                child: CustomButton(
                  fontSize: 14,
                  text: 'ReGenerate Scene',
                  onPressed: () {
                    controller.reGenerateOneImageScene(sceneImage, index);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

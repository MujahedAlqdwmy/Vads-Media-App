import 'package:ai_titans/view/widgets/animation_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/scenario_screen_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/row_buttons.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Scenario'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<ScenarioScreenControllerImp>(
              init: ScenarioScreenControllerImp(),
              builder: (controller) {
                return Column(
                  children: [
                    ...List.generate(controller.scenes.length, (i) {
                      return AnimationText(
                        number: controller.scenes[i].sceneNum,
                        text: controller.scenes[i].sceneDescription,
                      );
                    }),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RowButtons(
                        text1: 'ReGenerate',
                        onPressed1: () {
                          controller.reGenerateAllScenes();
                        },
                        text2: 'Continue',
                        onPressed2: () {
                          controller.generateScenesWithImage();
                        },
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

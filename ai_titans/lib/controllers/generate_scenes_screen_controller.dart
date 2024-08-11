import 'package:ai_titans/core/constants/api_links.dart';
import 'package:ai_titans/core/constants/app_rout.dart';
import 'package:ai_titans/data/models/scene_image_model.dart';
import 'package:get/get.dart';

import '../core/functions/crud.dart';
import '../core/functions/show_alert_waiting.dart';

abstract class GenerateScenesScreenController extends GetxController {}

class GenerateScenesScreenControllerImp extends GenerateScenesScreenController {
  List<SceneImage> scenesImages = [];

  @override
  void onInit() {
    scenesImages = Get.arguments as List<SceneImage>;
    super.onInit();
  }

  showDetails(SceneImage s, int index) {
    Get.toNamed(AppRoute.detailsSceneScreen, arguments: {
      'scene': s,
      'index': index,
    });
  }

  reGenerateOneImageSceneInDetails(SceneImage s, int index) async {
    await reGenerateOneImageScene(s, index);
    Get.back();
    update();
  }

  reGenerateOneImageScene(SceneImage s, int index) async {
    showAlertWaiting();
    var response = await Curd.postRequest(
        ApiLinks.getSceneImage, {'img_prompt': s.scene.prompt});
    if (response != null) {
      scenesImages[index]
          .changeOneScene(sceneImageFromJson(s.scene, response.body));
      Get.back();
      update();
    }
  }

  generateVideo() async {
    showAlertWaiting();
    await Future.delayed(const Duration(seconds: 5));
    Get.back();
  }
}

import 'package:ai_titans/core/constants/api_links.dart';
import 'package:get/get.dart';

import '../core/constants/app_rout.dart';
import '../core/functions/crud.dart';
import '../core/functions/show_alert_waiting.dart';
import '../data/models/scene_image_model.dart';
import '../data/models/scene_model.dart';

abstract class ScenarioScreenController extends GetxController {}

class ScenarioScreenControllerImp extends ScenarioScreenController {
  late ScenesList scenesModel;
  List<Scene> scenes = [];
  List<SceneImage> scenesImages = [];

  @override
  void onInit() {
    scenesModel = Get.arguments;
    scenes = scenesModel.scenes;
    super.onInit();
  }

  generateScenesWithImage() async {
    showAlertWaiting();
    for (Scene element in scenes) {
      var response = await Curd.postRequest(
          ApiLinks.getSceneImage, {'img_prompt': element.prompt});
      if (response != null) {
        SceneImage s = sceneImageFromJson(element, response.body);
        scenesImages.add(s);
      }
    }
    Get.back();
    Get.offAllNamed(AppRoute.generateScenesScreen, arguments: scenesImages);
  }

  reGenerateAllScenes() async {
    showAlertWaiting();
    var response =
        await Curd.postRequest(ApiLinks.getScenario, {'input': 'code_red'});
    Get.back();
    if (response != null) {
      scenesModel = scenesListFromJson(response.body);
      scenes = scenesModel.scenes;
      update();
    }
  }

  reGenerateOneScene(int index) async {
    showAlertWaiting();
    var response =
        await Curd.postRequest(ApiLinks.getScenario, {'input': '$index'});
    Get.back();
    if (response != null) {
      scenesModel.changeOneScene(
        index - 1,
        scenesListFromJson(response.body).getOneScene(index - 1),
      );
      scenes = scenesModel.scenes;
      update();
    }
  }
}

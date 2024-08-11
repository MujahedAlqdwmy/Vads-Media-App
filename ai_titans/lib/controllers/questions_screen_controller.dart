import 'package:ai_titans/core/constants/api_links.dart';
import 'package:ai_titans/core/constants/app_rout.dart';
import 'package:ai_titans/data/models/question_model.dart';
import 'package:ai_titans/core/functions/show_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_images.dart';
import '../core/functions/crud.dart';
import '../data/models/card_model.dart';
import '../core/functions/show_alert_waiting.dart';
import '../data/models/scene_model.dart';

abstract class QuestionsScreenController extends GetxController {}

class QuestionsScreenControllerImp extends QuestionsScreenController {
  late TextEditingController scriptText;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<QuestionModel> questions = [];
  List<GridItem> gridItems = [];

  final List<String> imageUrls = [
    AppImages.image1,
    AppImages.image2,
    AppImages.image3,
  ];

  @override
  void onInit() {
    scriptText = TextEditingController();

    questions = [
      QuestionModel(question: 'How many scenes do you want?'),
      QuestionModel(question: 'What type of video do you want?'),
      QuestionModel(question: 'Where was the video filmed?'),
      QuestionModel(question: 'Type of Color grading?'),
      QuestionModel(question: 'What time do you shoot the video?'),
    ];

    gridItems = [
      GridItem(
        icon: Icons.numbers,
        text: 'scenes',
        isAnswerd: false,
        onTap: () => showNumberFormBottomSheet(
          questions[0],
          gridItems[0],
          '1,2,3...',
        ),
      ),
      GridItem(
        icon: Icons.movie,
        text: 'Cinematic',
        isAnswerd: false,
        onTap: () => showTextFormBottomSheet(
          questions[1],
          gridItems[1],
          'Drama , Cinematic ....',
        ),
      ),
      GridItem(
        icon: Icons.door_front_door_rounded,
        text: 'Place',
        isAnswerd: false,
        onTap: () => showTextFormBottomSheet(
          questions[2],
          gridItems[2],
          'Indoor, Outdoor',
        ),
      ),
      GridItem(
        icon: Icons.color_lens,
        text: 'Coloring',
        isAnswerd: false,
        onTap: () => showTextFormBottomSheet(
          questions[3],
          gridItems[3],
          'Midnight Blue , Autumn Hues , Vintage Gold , Electric Dreams',
        ),
      ),
      GridItem(
        icon: Icons.timelapse_outlined,
        text: 'Time',
        isAnswerd: false,
        onTap: () => showTextFormBottomSheet(
          questions[4],
          gridItems[4],
          'Day , night',
        ),
      ),
    ];
    super.onInit();
  }

  saveAnswer(GridItem g, QuestionModel q, dynamic answer) {
    if (answer != null) {
      q.answer = answer;
      g.isAnswerd = true;
      update();
      Get.back();
    }
  }

  bool get isAllAnswerd {
    GridItem? response =
        gridItems.firstWhereOrNull((element) => !element.isAnswerd);

    if (response == null) {
      return true;
    } else {
      return false;
    }
  }

  generateScenario() async {
    if (formKey.currentState!.validate()) {
      showAlertWaiting();
      var response =
          await Curd.postRequest(ApiLinks.getScenario, {'input': _makeInput()});
      Get.back();
      if (response != null) {
        ScenesList scenesModel = scenesListFromJson(response.body);
        Get.toNamed(AppRoute.scenarioScreen, arguments: scenesModel);
      }
    }
  }

  String _makeInput() {
    String data = '';
    String temp = '';
    for (var element in questions) {
      if (element.answer != null) {
        temp = "${element.question}\n${element.answer.toString()}\n\n";
        data += temp;
      }
    }
    data = "$data\nprompt:${scriptText.text}";
    print(data);
    return data;
  }
}

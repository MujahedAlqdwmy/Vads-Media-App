import 'package:ai_titans/core/constants/app_rout.dart';
import 'package:ai_titans/core/style/theme.dart';
import 'package:ai_titans/view/screens/details_scene_screen.dart';
import 'package:ai_titans/view/screens/generate_scenes_screen.dart';
import 'package:ai_titans/view/screens/questions_screen.dart';
import 'package:ai_titans/view/screens/scenario_screen.dart';
import 'package:ai_titans/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.dark],
      getPages: [
        GetPage(
            name: AppRoute.questionsScreen,
            page: () => const QuestionsScreen()),
        GetPage(
            name: AppRoute.scenarioScreen, page: () => const ScenarioScreen()),
        GetPage(
            name: AppRoute.generateScenesScreen,
            page: () => const GenerateScenesWithImagesScreen()),
        GetPage(
            name: AppRoute.detailsSceneScreen,
            page: () => const DetailsSceneScreen()),
        GetPage(name: AppRoute.splashScreen, page: () => const SplashScreen()),
      ],
      initialRoute: AppRoute.splashScreen,
    );
  }
}

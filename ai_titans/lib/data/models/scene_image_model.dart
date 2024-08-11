import 'dart:convert';

import 'package:ai_titans/data/models/scene_model.dart';

SceneImage sceneImageFromJson(Scene scene, String str) =>
    SceneImage.fromJson(scene, json.decode(str));

String sceneImageToJson(SceneImage data) => json.encode(data.toJson());

class SceneImage {
  Scene scene;
  String imageUrl;

  SceneImage({
    required this.scene,
    required this.imageUrl,
  });

  factory SceneImage.fromJson(Scene scene, Map<String, dynamic> json) =>
      SceneImage(
        imageUrl: json["image_url"],
        scene: scene,
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };

  void changeOneScene(SceneImage s) {
    scene = s.scene;
    imageUrl = s.imageUrl;
  }

  String printText() {
    String temp =
        '${scene.sceneDescription}\n\nTooles : \n${scene.tools.printTooles()}';
    return temp;
  }
}

// To parse this JSON data, do
//
//     final scenesList = scenesListFromJson(jsonString);

import 'dart:convert';

ScenesList scenesListFromJson(String str) =>
    ScenesList.fromJson(json.decode(str));

String scenesListToJson(ScenesList data) => json.encode(data.toJson());

class ScenesList {
  List<Scene> scenes;

  ScenesList({
    required this.scenes,
  });

  factory ScenesList.fromJson(Map<String, dynamic> json) => ScenesList(
        scenes: List<Scene>.from(json["scenes"].map((x) => Scene.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scenes": List<dynamic>.from(scenes.map((x) => x.toJson())),
      };

  Scene getOneScene(int index) {
    return scenes[index];
  }

  void changeOneScene(int index, Scene s) {
    scenes[index] = s;
  }
}

class Scene {
  int sceneNum;
  String sceneDescription;
  String prompt;
  Tools tools;

  Scene({
    required this.sceneNum,
    required this.sceneDescription,
    required this.prompt,
    required this.tools,
  });

  factory Scene.fromJson(Map<String, dynamic> json) => Scene(
        sceneNum: json["scene_num"],
        sceneDescription: json["scene_description"],
        prompt: json["prompt"],
        tools: Tools.fromJson(json["tools"]),
      );

  Map<String, dynamic> toJson() => {
        "scene_num": sceneNum,
        "scene_description": sceneDescription,
        "prompt": prompt,
        "tools": tools.toJson(),
      };
}

class Tools {
  String camera;
  String lighting;
  String angle;
  String movement;

  Tools({
    required this.camera,
    required this.lighting,
    required this.angle,
    required this.movement,
  });

  factory Tools.fromJson(Map<String, dynamic> json) => Tools(
        camera: json["camera"],
        lighting: json["lighting"],
        angle: json["angle"],
        movement: json["movement"],
      );

  Map<String, dynamic> toJson() => {
        "camera": camera,
        "lighting": lighting,
        "angle": angle,
        "movement": movement,
      };

  String printTooles() {
    return 'camera : $camera\nlighting : $lighting\nangle : $angle\nmovement : $movement';
  }
}

import 'package:ai_titans/data/models/card_model.dart';
import 'package:ai_titans/data/models/question_model.dart';
import 'package:ai_titans/view/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTextFormBottomSheet(
  QuestionModel question,
  GridItem gridItem,
  String hintText,
) {
  Get.bottomSheet(
    TextFormBottomSheet(
      question: question,
      gridItem: gridItem,
      hintText: hintText,
    ),
    backgroundColor: Colors.transparent,
  );
}

void showNumberFormBottomSheet(
  QuestionModel question,
  GridItem gridItem,
  String hintText,
) {
  Get.bottomSheet(
    TextFormBottomSheet(
      question: question,
      gridItem: gridItem,
      keyboardType: TextInputType.number,
      hintText: hintText,
    ),
    backgroundColor: Colors.transparent,
  );
}

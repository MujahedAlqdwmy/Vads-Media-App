import 'package:ai_titans/controllers/questions_screen_controller.dart';
import 'package:ai_titans/data/models/card_model.dart';
import 'package:ai_titans/data/models/question_model.dart';
import 'package:ai_titans/core/functions/valid_input.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:ai_titans/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';

class TextFormBottomSheet extends GetView<QuestionsScreenControllerImp> {
  final QuestionModel question;
  final GridItem gridItem;
  final TextEditingController answerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextInputType? keyboardType;
  final String hintText;

  TextFormBottomSheet({
    super.key,
    required this.question,
    required this.gridItem,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    if (question.answer != null) {
      answerController.text = question.answer;
    }
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.darkPageBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question.question,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Form(
            key: _formKey,
            child: CustomTextFormField(
              keyboardType: keyboardType,
              controller: answerController,
              hintText: hintText,
              validator: (val) {
                return validInput(val!);
              },
            ),
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            text: 'Save Answer',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.saveAnswer(
                  gridItem,
                  question,
                  answerController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

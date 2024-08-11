import 'package:ai_titans/controllers/questions_screen_controller.dart';
import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/core/functions/valid_input.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:ai_titans/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScriptFieldWidget extends GetView<QuestionsScreenControllerImp> {
  const ScriptFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Script",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Form(
          key: controller.formKey,
          child: CustomTextFormField(
            controller: controller.scriptText,
            minLines: 5,
            maxLines: 5,
            fontSize: 18,
            hintText: 'Enter your script',
            validator: (val) {
              return validInput(val!);
            },
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: "Generate Scenario",
          onPressed: () {
            controller.generateScenario();
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  final String text1;
  final void Function()? onPressed1;
  final String text2;
  final void Function()? onPressed2;
  const RowButtons({
    super.key,
    required this.text1,
    required this.onPressed1,
    required this.text2,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: text1,
            onPressed: onPressed1,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            text: text2,
            onPressed: onPressed2,
          ),
        )
      ],
    );
  }
}

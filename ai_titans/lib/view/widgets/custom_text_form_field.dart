import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final String hintText;
  final String? Function(String?)? validator;
  final double? fontSize;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.minLines,
    this.maxLines,
    required this.hintText,
    required this.validator,
    this.fontSize,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: AppColors.darkBackgroundColor,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.transparent,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.transparent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.transparent,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}

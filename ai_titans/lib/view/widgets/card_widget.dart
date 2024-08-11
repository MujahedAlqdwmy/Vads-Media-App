import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isAnswerd;
  final Color colorGradiant1;
  final Color colorGradiant2;
  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.isAnswerd,
    required this.colorGradiant1,
    required this.colorGradiant2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorGradiant1,
            colorGradiant2,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Icon(
              icon,
              size: 27,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

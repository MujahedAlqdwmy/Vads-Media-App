import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/scenario_screen_controller.dart';

class AnimationText extends StatefulWidget {
  final String text;
  final int number;
  const AnimationText({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  AnimationTextState createState() => AnimationTextState();
}

class AnimationTextState extends State<AnimationText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;

  late String _text;
  late int _currentLength;

  @override
  void initState() {
    onInitial();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimationText oldWidget) {
    onInitial();
    super.didUpdateWidget(oldWidget);
  }

  onInitial() {
    _currentLength = 0;
    _text = widget.text;

    // Create animation controller
    _controller = AnimationController(
      duration: Duration(milliseconds: _text.length * 50),
      vsync: this,
    );

    // Create text animation
    _textAnimation = IntTween(begin: 0, end: _text.length).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentLength = _textAnimation.value;
        });
      });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScenarioScreenControllerImp controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Scene ${widget.number}",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          width: Get.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.darkBackgroundColor,
              borderRadius: BorderRadius.circular(20)),
          child: AnimatedBuilder(
            animation: _textAnimation,
            builder: (context, child) {
              // Build the text with current length
              String animatedText = _text.substring(0, _currentLength);
              return Column(
                children: [
                  SingleChildScrollView(
                    child: Text(
                      animatedText,
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 175,
            height: 40,
            child: CustomButton(
              fontSize: 14,
              text: 'ReGenerate Scene ${widget.number}',
              onPressed: () {
                controller.reGenerateOneScene(widget.number);
              },
            ),
          ),
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}

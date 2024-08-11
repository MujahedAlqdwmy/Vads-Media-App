import 'package:ai_titans/view/widgets/image_with_gradient_overlay.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSlider({super.key, required this.imageUrls});

  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ImageWithGradientOverlay(
                imageUrl: widget.imageUrls[index],
                gradientColors: const [
                  Colors.transparent,
                  AppColors.darkPageBackgroundColor,
                ],
              );
            },
          ),
          Align(
            heightFactor: 33,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: _currentIndex == index ? 10.0 : 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? AppColors.primaryColor : Colors.grey,
      ),
    );
  }
}

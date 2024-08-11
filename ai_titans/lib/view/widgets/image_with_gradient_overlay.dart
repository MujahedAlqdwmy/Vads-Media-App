import 'package:flutter/material.dart';

class ImageWithGradientOverlay extends StatelessWidget {
  final String imageUrl;
  final List<Color> gradientColors;

  const ImageWithGradientOverlay({
    super.key,
    required this.imageUrl,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image widget
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

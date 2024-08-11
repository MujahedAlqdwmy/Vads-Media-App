import 'package:flutter/material.dart';

class GridItem {
  final IconData icon;
  final String text;
  bool isAnswerd;
  final void Function()? onTap;

  GridItem({
    required this.icon,
    required this.text,
    required this.isAnswerd,
    required this.onTap,
  });
}


import 'package:flutter/material.dart';

class UsableTextWidget extends StatelessWidget {
  final String label;
  final double textSize;
  final String fontFamily;
  final FontWeight weight;
  final Color textColor;

  const UsableTextWidget({
    super.key,
    this.fontFamily = 'Gordita',
    required this.label,
    required this.weight,
    required this.textSize,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: textSize,
          fontWeight: weight,
          fontFamily: fontFamily,
          color: textColor
      ),
    );
  }

}
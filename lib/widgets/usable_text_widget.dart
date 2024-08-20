
import 'package:flutter/material.dart';

class UsableTextWidget extends StatelessWidget {
  final String label;
  final double textSize;
  final String fontFamily;
  final FontWeight weight;

  const UsableTextWidget({
    super.key,
    this.fontFamily = 'Gordita',
    required this.label,
    required this.weight,
    required this.textSize
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
          label,
          style: TextStyle(
              fontSize: textSize,
              fontWeight: weight,
              fontFamily: fontFamily,
              color: Theme.of(context).colorScheme.primary
          ),
        )
    );
  }

}
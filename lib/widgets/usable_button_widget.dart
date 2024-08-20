
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';

class UsableButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String label;

  const UsableButtonWidget({
    super.key,
    required this.onPressed,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: buttonHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonRadius),
        color: Theme.of(context).colorScheme.secondary
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSecondary
        )
      ),
    );
  }

}
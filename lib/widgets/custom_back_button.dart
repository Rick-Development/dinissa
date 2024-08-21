
import 'package:dinissa/widgets/usable_clickable_widget.dart';
import 'package:flutter/material.dart';

Widget customBackButton({
  required BuildContext context
}) {
  return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: UsableClickWidget(
        onClick: () => Navigator.pop(context),
        child: Image.asset(
            'assets/images/ic_back.png',
            width: 30.0,
            height: 30.0
        ),
      )
  );
}
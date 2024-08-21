
import 'package:flutter/material.dart';

import 'custom_back_button.dart';

AppBar customAppBar({
  required BuildContext context
}) {
  return AppBar(
    leading: customBackButton(context: context),
    surfaceTintColor: Theme.of(context).colorScheme.surface,
    backgroundColor: Theme.of(context).colorScheme.surface,
  );
}
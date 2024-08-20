
import 'package:flutter/material.dart';

class UsableClickWidget extends StatelessWidget {
  final Widget child;
  final Function onClick;

  const UsableClickWidget({
    super.key,
    required this.onClick,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onClick(),
      child: child
    );
  }

}
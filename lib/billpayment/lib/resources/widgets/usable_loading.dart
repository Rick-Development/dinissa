import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors.dart';

class UsableLoading extends StatelessWidget {
  final opacity ;
  const UsableLoading({super.key, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: AppColors.primaryColor.withOpacity(opacity),  // Semi-transparent background
     body: Container(
        color: AppColors.primaryColor.withOpacity(opacity),  // Semi-transparent background
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: AppColors.primaryColor,
            size: 100,
          ),
        ),
      ),
    );
  }
}

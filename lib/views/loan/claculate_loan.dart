import 'package:flutter/material.dart';
import 'package:dinissa/util/app_colors.dart';

import '../../accept_loan.dart';

// Your AcceptLoan screen
class CalculateLoanScreen extends StatelessWidget {
  const CalculateLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a delayed navigation to the AcceptLoan screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AcceptLoan()),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Dark background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              'assets/images/logo.png',
              height: 100, // Adjust the size as needed
            ),
            const SizedBox(height: 20),
            // Loading Text
            const Text(
              'Calculating your loan offer...',
              style: TextStyle(
                color: Colors.white, // White text color
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/loan/employment_details.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_back_button.dart';

class ImproveLoanOfferScreen extends StatelessWidget {
  const ImproveLoanOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF2D2D2D),
      appBar: AppBar(
        // backgroundColor: Color(0xFF2D2D2D),
        elevation: 0,
        leading:  customBackButton(context: context),
        title: const Text(
          'Improve your loan offer',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Share your work information to improve your chance of higher loan offers',
              style: TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildOption(
              icon: Icons.work,
              title: 'Employment Details',
              description: 'Update your employment and education status.',
              onTap: () {
                // Navigate to Employment Details screen
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmploymentDetailsScreen()));
              },
            ),
            const SizedBox(height: 20),
            _buildOption(
              icon: Icons.account_balance,
              title: 'Bank Statement',
              description: 'Share your bank statement to get a better loan offer.',
              onTap: () {
                // Navigate to Bank Statement screen
                print("Bank Statement tapped");
              },
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Continue action
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const EmploymentDetailsScreen()));
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child:  Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0x0f3c464c),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

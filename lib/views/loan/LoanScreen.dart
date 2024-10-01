import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loan/LoanController.dart';
import '../../widgets/custom_back_button.dart';
import 'improve_loan_offer.dart';

class LoanScreen extends StatelessWidget {
  final LoanController controller = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        // backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
        leading: customBackButton(context: context),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Transaction history",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Loan Amount Limit",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 10),
            Obx(() => Slider(
              value: controller.selectedLoanAmount.value,
              min: controller.minLoanAmount.value,
              max: controller.maxLoanAmount.value,
              divisions: (controller.maxLoanAmount.value - controller.minLoanAmount.value) ~/ 1000,
              onChanged: (value) => controller.updateLoanAmount(value),
              activeColor: AppColors.secondaryColor,
              inactiveColor: Colors.grey,
            )),
            Obx(() => Center(
              child: Text(
                "₦ ${controller.selectedLoanAmount.value.toStringAsFixed(0)}",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            )),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Interest Rate (16% PA)",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Icons.history, "Your History with ${AppConstants.appName}",
                "Your loan amount will be determined by your transaction history with us."),
            SizedBox(height: 10),
            _buildInfoRow(Icons.info, "Getting loan on ${AppConstants.appName}",
                "The more information we have about you, the better. Ensure your information is correct."),
            SizedBox(height: 10),
            _buildInfoRow(Icons.info, "Getting loan on ${AppConstants.appName}",
                "The more information we have about you, the better. Ensure your information is correct."),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImproveLoanOfferScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Apply for Loan",
                  style: TextStyle(fontSize: 18,color: Colors.white,),

                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

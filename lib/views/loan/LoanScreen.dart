import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loan/LoanController.dart';
import '../../widgets/custom_back_button.dart';
import 'improve_loan_offer.dart';

class LoanScreen extends StatefulWidget {

  const LoanScreen({super.key});
  @override
  State<LoanScreen> createState()=> LoanScreenState();
}

class LoanScreenState extends State<LoanScreen>{
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
              child: const Text(
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
            const Text(
              "Loan Amount Limit",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 10),
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
                style: const TextStyle(color: Colors.black, fontSize: 22),
              ),
            )),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Interest Rate (16% PA)",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoRow(Icons.history, "Your History with ${AppConstants.appName}",
                "Your loan amount will be determined by your transaction history with us."),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.info, "Getting loan on ${AppConstants.appName}",
                "The more information we have about you, the better. Ensure your information is correct."),
            const SizedBox(height: 10),
            // _buildInfoRow(Icons.info, "Getting loan on ${AppConstants.appName}",
            //     "The more information we have about you, the better. Ensure your information is correct."),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ImproveLoanOfferScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Apply for Loan",
                  style: TextStyle(fontSize: 18,color: Colors.white,),

                ),
              ),
            ),
            const SizedBox(height: 20),
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
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

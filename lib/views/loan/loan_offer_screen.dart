import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loan/loan_offer_controller.dart';
import '../../widgets/custom_back_button.dart';
import 'add_bank_statement_screen.dart';
// Ensure this import matches your file structure

class LoanOfferScreen extends StatefulWidget {

  const LoanOfferScreen({super.key});
  @override
  State<LoanOfferScreen> createState() => LoanOfferScreenState();
}
class LoanOfferScreenState extends State<LoanOfferScreen>{
  late LoanOfferController controller = Get.put(LoanOfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1F2D36),
      appBar: AppBar(
        // backgroundColor: Color(0xFF1F2D36),
        elevation: 0,
        leading: customBackButton(context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Improve your loan offer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Share your work information to improve your chance of higher loan offers',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Obx(
                  () => GestureDetector(
                onTap: controller.toggleAccountLink,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF344955),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        controller.isAccountLinked.value
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Link account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button action
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddBankStatementScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

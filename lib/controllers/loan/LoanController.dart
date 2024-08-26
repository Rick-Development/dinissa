import 'package:get/get.dart';

class LoanController extends GetxController {
  // Loan amount range
  final minLoanAmount = 2000.0.obs;
  final maxLoanAmount = 200000.0.obs;

  // Current loan amount selected
  var selectedLoanAmount = 2000.0.obs;

  // Update loan amount
  void updateLoanAmount(double value) {
    selectedLoanAmount.value = value;
  }
}

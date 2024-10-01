import 'package:get/get.dart';

class InvestmentController extends GetxController {
  var portfolio = ''.obs;
  var amount = 0.0.obs;
  var isLoading = false.obs;

  void selectPortfolio(String selectedPortfolio) {
    portfolio.value = selectedPortfolio;
  }

  void setAmount(double investmentAmount) {
    amount.value = investmentAmount;
  }

  Future<void> confirmInvestment() async {
    isLoading.value = true;
    // Call your investment API here
    // Example: await InvestmentService.confirmInvestment(portfolio.value, amount.value);
    isLoading.value = false;
  }

  void trackProgress() {
    // Implement logic to track investment progress
  }
}

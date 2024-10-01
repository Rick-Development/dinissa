import 'package:get/get.dart';

class BalanceController extends GetxController {
  // Observables to store balance values
  var balance = '₦205,000.00'.obs;
  var cryptoBalance = '₦123,300.00'.obs;
  // RxBool allows us to reactively track the visibility state
  var isBalanceVisible = true.obs;

  dynamic getBalanceVisibility(){
    return isBalanceVisible.isTrue ? true : false;
}
  // Method to toggle balance visibility
  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
    // print(isBalanceVisible);
  }

  // Method to update balance values
  void updateBalances(String newBalance, String newCryptoBalance) {
    balance.value = newBalance;
    cryptoBalance.value = newCryptoBalance;
  }

  // Method to get the current balances as a map
  Map<String, String> getBalances() {
    return {
      'Balance': balance.value,
      'Crypto': cryptoBalance.value,
    };
  }
}

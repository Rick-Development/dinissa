import 'package:get/get.dart';

class LoanOfferController extends GetxController {
  var isAccountLinked = false.obs;

  void toggleAccountLink() {
    isAccountLinked.value = !isAccountLinked.value;
  }
}


import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class LoanApplicationController extends GetxController {
  //form text input controllers
  final amountController = TextEditingController();
  final tenureController = TextEditingController();
  final extraController = TextEditingController();
  final purposeController = TextEditingController();

  final emailController = TextEditingController();
  final businessController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final roleController = TextEditingController();
  final idTypeController = TextEditingController();
  final idController = TextEditingController();

  // Form validation
  String? get validAmount => (amountController.text.isEmpty || amountController.text == "0") ?
      'loan amount is required.' : null;
  String? get validTenure => tenureController.text.isEmpty ? 'loan tenure is required.' : null;
  String? get validPurpose => purposeController.text.isEmpty ? 'load purpose is required.' : null;

  String? get validName => nameController.text.isEmpty ? 'your name is required.' : null;
  String? get validRole => roleController.text.isEmpty ? 'role is required.' : null;
  String? get validEmail => emailController.text.isEmpty ? 'email address required.' : null;
  String? get validBusiness => businessController.text.isEmpty ? 'employee name is required.' : null;
  String? get validAddress => addressController.text.isEmpty ? 'address is required.' : null;

  // Variables to hold selected values
  var selectedLoanTenure = ''.obs;
  var termsAccepted = false.obs;

}
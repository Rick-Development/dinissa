
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class LoanApplicationController extends GetxController {
  //form text input controllers
  final amountController = TextEditingController();
  final tenureController = TextEditingController();
  final extraController = TextEditingController();

  final emailController = TextEditingController();
  final businessController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final roleController = TextEditingController();

  //validation message for the input fields
  var amountError = ''.obs;
  var tenureError = ''.obs;
  var emailError = ''.obs;
  var businessError = ''.obs;
  var addressError = ''.obs;
  var nameError = ''.obs;
  var roleError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Add listeners to the controllers
    amountController.addListener(() {
      if (amountController.text.isNotEmpty) {
        amountError.value = '';
      }
    });

    tenureController.addListener(() {
      if (tenureController.text.isNotEmpty) {
        tenureError.value = '';
      }
    });

    emailController.addListener(() {
      if (emailController.text.isNotEmpty) {
        emailError.value = '';
      }
    });

    businessController.addListener(() {
      if (businessController.text.isNotEmpty) {
        businessError.value = '';
      }
    });

    addressController.addListener(() {
      if (addressController.text.isNotEmpty) {
        addressError.value = '';
      }
    });

    nameController.addListener(() {
      if (nameController.text.isNotEmpty) {
        nameError.value = '';
      }
    });

    roleController.addListener(() {
      if (roleController.text.isNotEmpty) {
        roleError.value = '';
      }
    });

  }

  // Form validation
  String? get validAmount => (amountController.text.isEmpty || amountController.text == "0") ?
      'loan amount is required.' : null;
  String? get validTenure => tenureController.text.isEmpty ? 'loan tenure is required.' : null;

  String? get validName => nameController.text.isEmpty ? 'your name is required.' : null;
  String? get validRole => roleController.text.isEmpty ? 'role is required.' : null;
  String? get validEmail => emailController.text.isEmpty ? 'email address required.' : null;
  String? get validBusiness => businessController.text.isEmpty ? 'employee name is required.' : null;
  String? get validAddress => addressController.text.isEmpty ? 'address is required.' : null;

  // Variables to hold selected values
  var selectedLoanTenure = ''.obs;
  var termsAccepted = false.obs;

}
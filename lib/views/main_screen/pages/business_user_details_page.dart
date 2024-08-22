import 'package:dinissa/views/main_screen/pages/document_upload_page.dart';
import 'package:dinissa/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/loan_application_controller.dart';
import '../../../util/app_colors.dart';
import '../../../widgets/usable_text_input_field.dart';
import '../../../widgets/usable_text_widget.dart';

class BusinessUserDetailsPage extends StatefulWidget {

  const BusinessUserDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _BusinessUserDetailsPage();

}

class _BusinessUserDetailsPage extends State<BusinessUserDetailsPage> {
  final LoanApplicationController controller = Get.put(LoanApplicationController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.00),
                        UsableTextWidget(
                            label: 'Employee Details',
                            weight: FontWeight.bold,
                            textSize: 21,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        UsableTextInputField(
                          onTextChanged: (value) {
                            controller.businessController.text = value;
                          },
                          label: 'Business Name',
                          hint: 'Enter Business Name',
                          inputType: TextInputType.text,
                          action: TextInputAction.next,
                          validator: controller.validBusiness,
                        ),
                        UsableTextInputField(
                          onTextChanged: (value) {
                            controller.emailController.text = value;
                          },
                          label: 'Email',
                          hint: 'Enter Email',
                          inputType: TextInputType.emailAddress,
                          action: TextInputAction.next,
                          validator: controller.validEmail,
                        ),
                        UsableTextInputField(
                          onTextChanged: (value) {
                            controller.addressController.text = value;
                          },
                          label: 'Address',
                          hint: 'Enter Address',
                          inputType: TextInputType.streetAddress,
                          action: TextInputAction.next,
                          validator: controller.validAddress,
                        ),
                        UsableTextInputField(
                          onTextChanged: (value) {
                            controller.nameController.text = value;
                          },
                          label: 'Name',
                          hint: 'Enter Your Name',
                          inputType: TextInputType.text,
                          action: TextInputAction.next,
                          validator: controller.validName,
                        ),
                        UsableTextInputField(
                          onTextChanged: (value) {
                            controller.roleController.text = value;
                          },
                          label: 'Role',
                          hint: 'Enter Your Role',
                          inputType: TextInputType.text,
                          action: TextInputAction.next,
                          validator: controller.validRole,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState?.validate() == true) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                const DocumentUploadPage() ));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor400,
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                            child: const Text('Proceed'),
                          ),
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}

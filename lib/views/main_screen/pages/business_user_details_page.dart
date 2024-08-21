import 'package:dinissa/views/main_screen/pages/document_upload_page.dart';
import 'package:dinissa/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../util/app_colors.dart';
import '../../../widgets/usable_text_input_field.dart';
import '../../../widgets/usable_text_widget.dart';

class BusinessUserDetailsPage extends StatelessWidget {
  const BusinessUserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.00),
                    UsableTextWidget(
                        label: 'Business User Details',
                        weight: FontWeight.bold,
                        textSize: 21,
                        textColor: Theme.of(context).colorScheme.primary
                    ),
                    UsableTextInputField(
                      onTextChanged: (value) {},
                      label: 'Business Name',
                      hint: 'Enter Business Name',
                      inputType: TextInputType.text,
                      action: TextInputAction.next,
                    ),
                    UsableTextInputField(
                      onTextChanged: (value) {},
                      label: 'Business Email',
                      hint: 'Enter Business Email',
                      inputType: TextInputType.emailAddress,
                      action: TextInputAction.next,
                    ),
                    UsableTextInputField(
                      onTextChanged: (value) {},
                      label: 'Business Address',
                      hint: 'Enter Business Address',
                      inputType: TextInputType.streetAddress,
                      action: TextInputAction.next,
                    ),
                    UsableTextInputField(
                      onTextChanged: (value) {},
                      label: 'Your Name',
                      hint: 'Enter Your Name',
                      inputType: TextInputType.text,
                      action: TextInputAction.next,
                    ),
                    UsableTextInputField(
                      onTextChanged: (value) {},
                      label: 'Role',
                      hint: 'Enter Your Role',
                      inputType: TextInputType.text,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          const DocumentUploadPage() ));
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
    );
  }
}

import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/widgets/custom_app_bar.dart';
import 'package:dinissa/widgets/usable_bottom_sheet_widget.dart';
import 'package:dinissa/widgets/usable_clickable_widget.dart';
import 'package:dinissa/widgets/usable_text_input_field.dart';
import 'package:dinissa/widgets/usable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/loan_application_controller.dart';
import 'business_user_details_page.dart';

class LoanApplicationPage extends StatefulWidget {

  const LoanApplicationPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoanApplicationPage();

}

class _LoanApplicationPage extends State<LoanApplicationPage> {
  late LoanApplicationController controller;
  final _formKey = GlobalKey<FormState>();
  final _tenureNode = FocusNode();
  final _purposeNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoanApplicationController(), tag: UniqueKey().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 42.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.00),
                        UsableTextWidget(
                            label: 'Create Loan Application',
                            weight: FontWeight.bold,
                            textSize: 21,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        UsableTextWidget(
                            label: 'Your credit limit: ₦100,000',
                            weight: FontWeight.w400,
                            textSize: 16,
                            fontFamily: 'Roboto',
                            textColor: Theme.of(context).colorScheme.primary.withOpacity(0.7)
                        ),
                        UsableTextInputField(
                            controller: controller.amountController,
                            label: 'Loan Amount',
                            hint: 'Enter Loan Amount',
                            inputType: TextInputType.number,
                            action: TextInputAction.next,
                            validator: controller.validAmount,
                            onTextChanged: (value) {
                              controller.amountController.text = value;
                            }
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('₦5,000'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('₦10,000'),
                            ),
                          ],
                        ),
                        CustomDropTextInputField(
                          controller: controller.tenureController,
                          node: _tenureNode,
                          hint: 'Choose Loan Tenure',
                          label: 'Loan Tenure',
                          onTouched: () {
                            showLoanTenureBottomSheet(
                                context: context,
                                onSelected: (value) {
                                  controller.tenureController.text = value;
                                }
                            );
                          },
                          validator: controller.validTenure,
                          onTextChanged: (value) {},
                        ),
                        CustomDropTextInputField(
                          controller: controller.purposeController,
                          node: _purposeNode,
                          hint: 'Choose Loan Purpose',
                          label: 'Loan Purpose',
                          onTouched: () {
                            showLoanPurposeBottomSheet(
                                context: context,
                                onSelected: (value) {
                                  controller.purposeController.text = value;
                                }
                            );
                          },
                          validator: controller.validPurpose,
                          onTextChanged: (value) {},
                        ),
                        UsableTextInputField(
                            controller: controller.extraController,
                            label: 'Extra Payment',
                            hint: 'Extra Payment (optional)',
                            inputType: TextInputType.number,
                            action: TextInputAction.next,
                            onTextChanged: (value) {
                              controller.extraController.text = value;
                            }
                        ),
                        const SizedBox(height: 14.0),
                        UsableTextWidget(
                            label: 'Applicable Interest rate: 15%',
                            weight: FontWeight.normal,
                            textSize: 14,
                            fontFamily: 'Poppins',
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        const SizedBox(height: 16),
                        UsableTextWidget(
                            label: 'Monthly Payment: NIL',
                            weight: FontWeight.normal,
                            textSize: 13,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        UsableTextWidget(
                            label: 'No of Payments: NIL',
                            weight: FontWeight.normal,
                            textSize: 13,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        UsableTextWidget(
                            label: 'Total Payback: NIL',
                            weight: FontWeight.normal,
                            textSize: 13,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: true,
                              visualDensity: VisualDensity.comfortable,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onChanged: (newValue) {},
                            ),
                            Expanded(child: UsableTextWidget(
                                label: 'I agree to the Terms & Conditions and Policy.',
                                weight: FontWeight.normal,
                                textSize: 14,
                                textColor: Theme.of(context).colorScheme.primary
                            ))
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState?.validate() == true) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> BusinessUserDetailsPage() ));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor400,
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                            child: const Text('Apply Now'),
                          ),
                        )
                      ]
                  )
              )
            ),
          )
      )
    );
  }

  void revalidateForm() {
    setState(() => _formKey.currentState?.validate());
  }

  void showLoanTenureBottomSheet({
    required BuildContext context,
    required Function(String value) onSelected
  }) {
    final tenures = ['6 months','12 months', '24 months'];

    _tenureNode.unfocus();
    customBottomSheetWidget(
        context: context,
        initialHeight: 0.2,
        maxHeight: 0.3,
        child: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14.0),
                  ...tenures.map((tenure) =>
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                      child: UsableClickWidget(
                          onClick: () {
                            Navigator.pop(context);
                            onSelected(tenure);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: UsableTextWidget(
                                label: tenure,
                                weight: FontWeight.w400,
                                textSize: 14,
                                textColor: Theme.of(context).colorScheme.primary
                            ),
                          )
                      )
                  ))
                ]
            )
        )
    );
  }

  void showLoanPurposeBottomSheet({
    required BuildContext context,
    required Function(String value) onSelected
  }) {
    final purposes = ['School fees','Health care', 'Travelling expenses'];

    _purposeNode.unfocus();
    customBottomSheetWidget(
        context: context,
        initialHeight: 0.2,
        maxHeight: 0.3,
        child: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14.0),
                  ...purposes.map((tenure) =>
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                          child: UsableClickWidget(
                              onClick: () {
                                Navigator.pop(context);
                                onSelected(tenure);
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: UsableTextWidget(
                                    label: tenure,
                                    weight: FontWeight.w400,
                                    textSize: 14,
                                    textColor: Theme.of(context).colorScheme.primary
                                ),
                              )
                          )
                      ))
                ]
            )
        )
    );
  }

}

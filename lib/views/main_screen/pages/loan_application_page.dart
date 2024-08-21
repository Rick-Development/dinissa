import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/widgets/custom_app_bar.dart';
import 'package:dinissa/widgets/custom_back_button.dart';
import 'package:dinissa/widgets/usable_bottom_sheet_widget.dart';
import 'package:dinissa/widgets/usable_button_widget.dart';
import 'package:dinissa/widgets/usable_clickable_widget.dart';
import 'package:dinissa/widgets/usable_text_input_field.dart';
import 'package:dinissa/widgets/usable_text_widget.dart';
import 'package:flutter/material.dart';

import 'business_user_details_page.dart';

class LoanApplicationPage extends StatelessWidget {
  const LoanApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
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
                      onTextChanged: (value) {},
                      label: 'Loan Amount',
                      hint: 'Enter Loan Amount',
                      inputType: TextInputType.number,
                      action: TextInputAction.next,
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
                      onTextChanged: (value) {},
                      onTouched: () => showLoanTenureBottomSheet(context),
                      hint: 'Choose Loan Tenure',
                      label: 'Loan Tenure'
                  ),
                  UsableTextInputField(
                    onTextChanged: (value) {},
                    label: 'Extra Payment',
                    hint: 'Extra Payment (optional)',
                    inputType: TextInputType.number,
                    action: TextInputAction.next,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        const BusinessUserDetailsPage() ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor400,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Apply Now'),
                    ),
                  ),
                  /*
                  UsableButtonWidget(
                      onPressed: () {},
                      label: 'Apply Now'
                  )
                   */
                ],
              ),
            ),
          )
      )
    );
  }

  void showLoanTenureBottomSheet(BuildContext context) {
    customBottomSheetWidget(
        context: context,
        initialHeight: 0.3,
        maxHeight: 0.34,
        child: const SizedBox(
            width: double.infinity,
            child: Column(
                children: [

                ]
            )
        )
    );
  }

}

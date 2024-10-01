import 'package:dinissa/views/loan/loan_approved_page.dart';
import 'package:dinissa/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../util/app_colors.dart';
import '../../../widgets/usable_text_widget.dart';

class DocumentUploadPage extends StatelessWidget {
  const DocumentUploadPage({super.key});

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
                      label: 'Business Documents',
                      weight: FontWeight.bold,
                      textSize: 21,
                      textColor: Theme.of(context).colorScheme.primary
                  ),
                  const SizedBox(height: 16.00),
                  UploadDocumentTile(
                    title: 'Bank Statement',
                    onTap: () {
                      // Handle upload logic
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadDocumentTile(
                    title: 'CAC Document',
                    onTap: () {
                      // Handle upload logic
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadDocumentTile(
                    title: 'Govt ID',
                    onTap: () {
                      // Handle upload logic
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadDocumentTile(
                    title: 'Address Verification',
                    onTap: () {
                      // Handle upload logic
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        const LoanApprovedPage() ));
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

class UploadDocumentTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const UploadDocumentTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0XFFF9FAFC)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(Icons.upload_file, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

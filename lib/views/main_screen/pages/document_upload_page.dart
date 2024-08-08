import 'package:dinissa/views/main_screen/pages/loan_approved_page.dart';
import 'package:flutter/material.dart';

class DocumentUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UploadDocumentTile(
              title: 'Bank Statement',
              onTap: () {
                // Handle upload logic
              },
            ),
            SizedBox(height: 16),
            UploadDocumentTile(
              title: 'CAC Document',
              onTap: () {
                // Handle upload logic
              },
            ),
            SizedBox(height: 16),
            UploadDocumentTile(
              title: 'Govt ID',
              onTap: () {
                // Handle upload logic
              },
            ),
            SizedBox(height: 16),
            UploadDocumentTile(
              title: 'Address Verification',
              onTap: () {
                // Handle upload logic
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                     LoanApprovedPage() ));

                },
                child: Text('Proceed'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadDocumentTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  UploadDocumentTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.upload_file, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

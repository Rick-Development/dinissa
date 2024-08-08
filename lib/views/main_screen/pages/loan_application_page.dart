import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';

import '../../loan_save_screen.dart';
import 'business_user_details_page.dart';

class LoanApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.00,),
            Text(
              "Your credit limit: ₦100,000",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Loan Amount',
                // prefixIcon: Icon(Icons.),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('₦5,000'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('₦10,000'),
                ),
              ],
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Select Loan Tenure',
                border: OutlineInputBorder(),
              ),
              items: ['6 months', '12 months', '24 months']
                  .map((String tenure) {
                return DropdownMenuItem(
                  value: tenure,
                  child: Text(tenure),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
            SizedBox(height: 16),
            Text(
              'Applicable Interest rate: 15%',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Extra payment (optional)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Monthly Payment: NIL'),
                Text('No of Payments: NIL'),
                Text('Total Payback: NIL'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (newValue) {},
                ),
                Text('I agree to the Terms & Conditions and Policy.'),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      BusinessUserDetailsPage() ));
                },
                child: Text('Apply Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor400,
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

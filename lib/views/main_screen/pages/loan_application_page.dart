import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';

import 'business_user_details_page.dart';

class LoanApplicationPage extends StatelessWidget {
  const LoanApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35.00,),
            const Text(
              "Your credit limit: ₦100,000",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter Loan Amount',
                // prefixIcon: Icon(Icons.),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: const InputDecoration(
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
            const SizedBox(height: 16),
            const Text(
              'Applicable Interest rate: 15%',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Extra payment (optional)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Monthly Payment: NIL'),
                Text('No of Payments: NIL'),
                Text('Total Payback: NIL'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (newValue) {},
                ),
                const Text('I agree to the Terms & Conditions and Policy.'),
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
          ],
        ),
      ),
    );
  }
}

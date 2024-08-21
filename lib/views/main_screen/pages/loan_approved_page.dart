import 'package:dinissa/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class LoanApprovedPage extends StatelessWidget {
  const LoanApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Approved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.celebration,
                    size: 50,
                    color: Colors.green,
                  ),
                  Text(
                    "Congrats! You are eligible.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kindly allow 3-4 days to reflect in your bank account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Summary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TransactionDetailRow(
                    label: 'Purpose of Loan',
                    value: 'School Fees',
                  ),
                  TransactionDetailRow(
                    label: 'Next Repayment Date',
                    value: '02/04/2021',
                  ),
                  TransactionDetailRow(
                    label: 'Interest Rate',
                    value: '10%',
                  ),
                  TransactionDetailRow(
                    label: 'Monthly Payment',
                    value: '₦5,000',
                  ),
                  TransactionDetailRow(
                    label: 'No of Payments',
                    value: '24',
                  ),
                  TransactionDetailRow(
                    label: 'Total Payback Amount',
                    value: '₦58,000',
                  ),
                ],
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        const DashboardScreen() ));

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Accept'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        const DashboardScreen() ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const TransactionDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:dinissa/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class LoanApprovedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Approved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
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
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        MainScreen() ));

                  },
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        MainScreen() ));
                  },
                  child: Text('Decline'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
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

  TransactionDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

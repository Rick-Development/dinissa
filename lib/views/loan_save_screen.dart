import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';
import '../util/app_colors.dart';
import '../util/app_constant.dart';

class LoanSaveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan & Save'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loan and Saving Services',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.savings, color: AppColors.secondaryColor, size: 40),
                  title: Text('Savings Account'),
                  subtitle: Text('Open a savings account to save your money securely.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to savings account details or actions
                  },
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.account_balance_wallet, color: AppColors.secondaryColor, size: 40),
                  title: Text('Apply for Loan'),
                  subtitle: Text('Get a loan with easy and flexible terms.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to loan application process
                  },
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.payment, color: AppColors.secondaryColor, size: 40),
                  title: Text('Loan Repayment'),
                  subtitle: Text('Repay your loan with our easy payment options.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to loan repayment details or actions
                  },
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.trending_up, color: AppColors.secondaryColor, size: 40),
                  title: Text('Investment Plans'),
                  subtitle: Text('Explore our investment plans to grow your savings.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to investment plans details or actions
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(initialIndex: 2),
    );
  }
}

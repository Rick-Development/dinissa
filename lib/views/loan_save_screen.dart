
import 'package:dinissa/views/main_screen/pages/finance_screen.dart';
import 'package:dinissa/views/main_screen/pages/loan_application_page.dart';
import 'package:flutter/material.dart';
import '../util/app_colors.dart';

class LoanSaveScreen extends StatelessWidget {
  const LoanSaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Finances',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.savings, color: AppColors.secondaryColor, size: 40),
                  title: const Text('Savings Account'),
                  subtitle: const Text('Open a savings account to save your money securely.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to savings account details or actions
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                       const FinanceScreen() ));
                  },
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: AppColors.secondaryColor, size: 40),
                  title: const Text('Apply for Loan'),
                  subtitle: const Text('Get a loan with easy and flexible terms.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to loan application process
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        const LoanApplicationPage() ));
                  },
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.payment, color: AppColors.secondaryColor, size: 40),
                  title: const Text('Loan Repayment'),
                  subtitle: const Text('Repay your loan with our easy payment options.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to loan repayment details or actions
                  },
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.trending_up, color: AppColors.secondaryColor, size: 40),
                  title: const Text('Investment Plans'),
                  subtitle: const Text('Explore our investment plans to grow your savings.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to investment plans details or actions
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Footer(initialIndex: 2),
    );
  }
}

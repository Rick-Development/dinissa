import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loan_application_page.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finance'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Savings'),
              Tab(text: 'Loan'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            SavingsTag(),
            LoanApplicationPage(),
          ],
        ),
      ),
    );
  }
}

class SavingsTag extends StatelessWidget {
  const SavingsTag({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Earn Interest on maturity',
                  style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Start with as little as ₦200',
                  style: TextStyle(fontSize: 16.0,
                    color: Colors.white,),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Get Interest Now'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Total Interest',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦XX,XXX',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '₦X,XXX',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: [
              SavingsCard(
                icon: const Icon(Icons.account_balance_wallet),
                title: 'Wallet',
                description:
                    'You can deposit this amount in OWealth and earn daily interests.',
                amount: '₦0.00',
                color: AppColors.primaryColor700,
              ),
              SavingsCard(
                icon: const Icon(Icons.account_balance_wallet),
                title: 'OWealth',
                description:
                    'Your daily returns. You can withdraw at any time.',
                amount: '₦0.00',
                color: AppColors.primaryColor100,
              ),
              SavingsCard(
                icon: const Icon(Icons.account_balance_wallet),
                title: 'Targets',
                description: 'Plans: 1',
                amount: '₦0.00',
                color: Colors.blue[100],
              ),
              SavingsCard(
                icon: const Icon(Icons.lock_clock_rounded),
                title: 'SafeBox',
                description: 'Your daily, weekly or monthly automatic savings.',
                amount: '₦X,XXX',
                color: Colors.pink[100],
              ),
              SavingsCard(
                icon: const Icon(Icons.lock_rounded),
                title: 'Fixed',
                description: 'Min: ₦1000\nTenor: 7-1000 days',
                color: Colors.teal[100],
              ),
              SavingsCard(
                icon: const Icon(Icons.savings),
                title: 'Spend & Save',
                description:
                    'Your percentage savings every time you spend or transfer.',
                color: Colors.orange[100],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SavingsCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final String? amount;
  final Color? color;
  const SavingsCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      this.amount,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: 5.w,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.0.h),
          Text(
            description,
            style: const TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 8.0),
          // if (amount!.isNotEmpty)
          Text(
            amount ?? "",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class LoanTab extends StatelessWidget {
  const LoanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Loan Tab Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

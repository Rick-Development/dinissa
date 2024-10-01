import 'package:dinissa/views/ComingSoonScreen.dart';
import 'package:dinissa/views/invest/investment_screen.dart';
import 'package:dinissa/views/loan/LoanScreen.dart';
import 'package:dinissa/views/savings/saving_screen.dart';
import 'package:dinissa/views/transactions/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:dinissa/views/loan/loan_application_page.dart';

import '../app_colors.dart';
// import '../screens/send_funds_screen.dart'; // Import necessary screens
// import '../screens/bank_related_screen.dart';
// import '../screens/add_fund_screen.dart';
// import '../screens/withdraw_screen.dart';
// import '../screens/airtime_screen.dart';
// import '../screens/data_services_screen.dart';
// import '../screens/betting_screen.dart';
// import '../screens/cable_tv_screen.dart';
// import '../screens/save_screen.dart';
// import '../screens/loan_screen.dart';
// import '../screens/invest_screen.dart';
// import '../screens/transactions_screen.dart';

class FinanceServicesGrid extends StatelessWidget {
  const FinanceServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            // My Favorites Section
            Visibility(
              visible: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Favorites',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),

            // Horizontal List of Favorites Icons
            Visibility(
              visible: false,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.favorite, // Replace with actual icons
                            size: 40,
                          ),
                          Text('Favorite ${index + 1}'), // Replace with actual labels
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Tab Content (GridView for Services)
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildServiceCard(context, 'To Dinissa', Icons.send, const ComingSoonScreen()),
                _buildServiceCard(context, 'To Bank', Icons.account_balance, const ComingSoonScreen()),
                _buildServiceCard(context, 'Add Fund', Icons.add_circle, const ComingSoonScreen()),
                _buildServiceCard(context, 'Withdraw', Icons.money_off, const ComingSoonScreen()),
                _buildServiceCard(context, 'Airtime', Icons.phone_android, const ComingSoonScreen()),
                _buildServiceCard(context, 'Data', Icons.wifi, const ComingSoonScreen()),
                _buildServiceCard(context, 'Betting', Icons.sports_soccer, const ComingSoonScreen()),
                _buildServiceCard(context, 'Cable Tv', Icons.tv, const ComingSoonScreen()),
                _buildServiceCard(context, 'Save', Icons.savings, const SavingScreen()),
                _buildServiceCard(context, 'Loan', Icons.request_quote,  LoanScreen()),
                _buildServiceCard(context, 'Invest', Icons.assessment,  InvestmentScreen()),
                _buildServiceCard(context, 'Transactions', Icons.receipt_long,   TransactionHistoryScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, IconData icon, Widget screen) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: AppColors.secondaryColor,
          ), // Replace with actual icons
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

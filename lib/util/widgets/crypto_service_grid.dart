
import 'package:dinissa/views/ComingSoonScreen.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class CryptoServicesGrid extends StatelessWidget {
  const CryptoServicesGrid({super.key});

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
            Visibility(visible: false,child: Row(
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
            )),
            const SizedBox(height: 8.0),

            // Horizontal List of Favorites Icons
            Visibility(visible: false,child: SingleChildScrollView(
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
            )),
            const SizedBox(height: 16.0),

            // Tab Content (GridView for Services)
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildServiceCard(context, 'Buy Crypto', Icons.attach_money, const ComingSoonScreen()), // Buying cryptocurrency
                _buildServiceCard(context, 'Sell Crypto', Icons.money_off, const ComingSoonScreen()), // Selling cryptocurrency
                _buildServiceCard(context, 'Swap', Icons.swap_horiz, const ComingSoonScreen()), // Swapping currencies
                _buildServiceCard(context, 'Withdraw', Icons.account_balance_wallet, const ComingSoonScreen()), // Withdrawing funds
                _buildServiceCard(context, 'Deposit', Icons.account_balance, const ComingSoonScreen()), // Depositing funds
                _buildServiceCard(context, 'P2P', Icons.people_alt, const ComingSoonScreen()), // Peer-to-peer transactions
                _buildServiceCard(context, 'Pre-Market', Icons.query_stats, const ComingSoonScreen()), // Pre-market analysis
                _buildServiceCard(context, 'Market', Icons.bar_chart, const ComingSoonScreen()), // Market overview
                _buildServiceCard(context, 'Convert to fiat', Icons.currency_exchange, const ComingSoonScreen()), // Converting to fiat currency
                _buildServiceCard(context, 'Top Gain', Icons.trending_up, const ComingSoonScreen()), // Top gainers
                _buildServiceCard(context, 'Top Loser', Icons.trending_down, const ComingSoonScreen()), // Top losers
                _buildServiceCard(context, 'History', Icons.history, const ComingSoonScreen()), // Transaction or market history

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, IconData icon, Widget screen) {
    return  InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40.0,
          color: AppColors.secondaryColor,
        ), // Replace with actual icons
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
      ],
    )
    );
  }
}

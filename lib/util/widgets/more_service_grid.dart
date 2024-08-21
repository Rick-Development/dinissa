
import 'package:flutter/material.dart';

import '../app_colors.dart';

class MoreServicesGrid extends StatelessWidget {
  const MoreServicesGrid({super.key});

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

            const Center(
              child: Text(
                "Coming Soon..."
              ),
            ),

            // Tab Content (GridView for Services)
            Visibility(
              visible: false,
                child:
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildServiceCard('Bybit Earn', Icons.savings),
                _buildServiceCard('Invite Friends', Icons.people),
                _buildServiceCard('Web3', Icons.web),
                _buildServiceCard('Rewards Hub', Icons.card_giftcard),
                _buildServiceCard('Copy Trading', Icons.copy),
                _buildServiceCard('TradingBot', Icons.smart_toy),
                _buildServiceCard('Pre-Market Trading', Icons.show_chart),
                _buildServiceCard('Launchpool', Icons.pool),
                _buildServiceCard('Wed Airdrop', Icons.airplanemode_active),
                _buildServiceCard('ByStarter', Icons.star),
                _buildServiceCard('TrendMiner', Icons.trending_up),
                _buildServiceCard('Daily Delight', Icons.today),
              ],
            )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Column(
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
    );
  }
}

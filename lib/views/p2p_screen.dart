
import 'package:flutter/material.dart';
import '../util/app_colors.dart';

class P2PScreen extends StatelessWidget {
  const P2PScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P2P'),
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
                'P2P Cryptocurrency Trading',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.shopping_cart,
                      color: AppColors.secondaryColor, size: 40),
                  title: const Text('Buy Crypto'),
                  subtitle: const Text(
                      'Buy cryptocurrency from other users securely.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the buy crypto section
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
                  leading: const Icon(Icons.sell,
                      color: AppColors.secondaryColor, size: 40),
                  title: const Text('Sell Crypto'),
                  subtitle: const Text(
                      'Sell your cryptocurrency to other users securely.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the sell crypto section
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
                  leading: const Icon(Icons.history,
                      color: AppColors.secondaryColor, size: 40),
                  title: const Text('Transaction History'),
                  subtitle: const Text('View your past transactions.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the transaction history section
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
                  leading: const Icon(Icons.support,
                      color: AppColors.secondaryColor, size: 40),
                  title: const Text('Customer Support'),
                  subtitle:
                      const Text('Get help and support for your transactions.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the customer support section
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

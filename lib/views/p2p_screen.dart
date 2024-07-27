import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';
import '../util/app_colors.dart';
import '../util/app_constant.dart';

class P2PScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P2P'),
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
                'P2P Cryptocurrency Trading',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart, color: AppColors.secondaryColor, size: 40),
                  title: Text('Buy Crypto'),
                  subtitle: Text('Buy cryptocurrency from other users securely.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the buy crypto section
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
                  leading: Icon(Icons.sell, color: AppColors.secondaryColor, size: 40),
                  title: Text('Sell Crypto'),
                  subtitle: Text('Sell your cryptocurrency to other users securely.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the sell crypto section
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
                  leading: Icon(Icons.history, color: AppColors.secondaryColor, size: 40),
                  title: Text('Transaction History'),
                  subtitle: Text('View your past transactions.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the transaction history section
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
                  leading: Icon(Icons.support, color: AppColors.secondaryColor, size: 40),
                  title: Text('Customer Support'),
                  subtitle: Text('Get help and support for your transactions.'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to the customer support section
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(initialIndex: 1),
    );
  }
}

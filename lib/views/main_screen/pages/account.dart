import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF01325d), // Dark blue background color
        elevation: 0,
        title: const Text('My Account'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with the actual image
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF01325d), // Dark blue background color
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Show Dashboard Account Balances',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Enable Notifications',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                          activeColor: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                _buildListTile(
                  icon: Icons.note_add_outlined,
                  title: 'Loan Apply',
                ),
                _buildListTile(
                  icon: Icons.payment_outlined,
                  title: 'Apply for Topup',
                ),
                _buildListTile(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Liquidation',
                ),
                _buildListTile(
                  icon: Icons.article_outlined,
                  title: 'Letter of indebtedness',
                ),
                _buildListTile(
                  icon: Icons.article_outlined,
                  title: 'Letter of non-indebtedness',
                ),
                _buildListTile(
                  icon: Icons.payment_outlined,
                  title: 'Make repayments manually',
                ),
                _buildListTile(
                  icon: Icons.support_agent_outlined,
                  title: 'Contact Support',
                ),
                _buildListTile(
                  icon: Icons.lock_reset_outlined,
                  title: 'Reset Password',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF01325d), // Dark blue color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        tileColor: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        onTap: () {},
      ),
    );
  }
}

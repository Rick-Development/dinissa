import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: const Center(
        child: Text(
          'Wallet Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: const Footer(initialIndex: 3),
    );
  }
}

import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Text(
          'Wallet Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),      
      bottomNavigationBar: Footer(initialIndex: 3),
    );
  }
}

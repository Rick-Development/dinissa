import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';

class BuySellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy/Sell'),
      ),
      body: Center(
        child: Text(
          'Buy/Sell Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),      
      bottomNavigationBar: Footer(initialIndex: 1),
    );
  }
}

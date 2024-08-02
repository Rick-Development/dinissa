import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy/Sell'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Buy/Sell Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

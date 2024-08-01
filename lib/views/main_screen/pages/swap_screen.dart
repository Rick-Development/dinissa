import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Swap Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

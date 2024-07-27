import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap'),
      ),
      body: Center(
        child: Text(
          'Swap Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),      
      bottomNavigationBar: Footer(initialIndex: 2),
    );
  }
}

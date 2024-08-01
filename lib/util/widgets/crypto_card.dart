import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final dynamic crypto;

  const CryptoCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: ListTile(
        leading: Image.network(crypto['image'], width: 40),
        title: Text(crypto['name']),
        subtitle: Text('Price: \$${crypto['current_price']}'),
        trailing: Text(
          '${crypto['price_change_percentage_24h'].toStringAsFixed(2)}%',
          style: TextStyle(
            color: crypto['price_change_percentage_24h'] >= 0
                ? Colors.green
                : Colors.red,
          ),
        ),
      ),
    );
  }
}

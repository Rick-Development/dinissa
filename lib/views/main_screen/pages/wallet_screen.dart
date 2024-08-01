import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.yellow.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Total Assets"),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("0.40"),
                        TextButton(onPressed: () {}, child: const Text("USD"))
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              child: const Column(
                children: [
                  Row(),
                  Row(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("My Accounts"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

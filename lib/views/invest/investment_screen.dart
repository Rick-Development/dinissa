import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/invest/investment_controller.dart';

class InvestmentScreen extends StatelessWidget {
  final InvestmentController _investmentController = Get.put(InvestmentController());

  InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investment')),
      body: Obx(() {
        return _investmentController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            // Portfolio Selection
            DropdownButton<String>(
              value: _investmentController.portfolio.value.isEmpty ? null : _investmentController.portfolio.value,
              items: ['Portfolio 1', 'Portfolio 2', 'Portfolio 3']
                  .map((portfolio) => DropdownMenuItem(value: portfolio, child: Text(portfolio)))
                  .toList(),
              onChanged: (value) {
                _investmentController.selectPortfolio(value!);
              },
              hint: const Text('Select Portfolio'),
            ),
            // Amount Input
            TextField(
              onChanged: (value) => _investmentController.setAmount(double.parse(value)),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            // Confirm Investment Button
            ElevatedButton(
              onPressed: () => _investmentController.confirmInvestment(),
              child: const Text('Confirm Investment'),
            ),
            // Track Progress Button
            ElevatedButton(
              onPressed: () => _investmentController.trackProgress(),
              child: const Text('Track Progress'),
            ),
          ],
        );
      }),
    );
  }
}

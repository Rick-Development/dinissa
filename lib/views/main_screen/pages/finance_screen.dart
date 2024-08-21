import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/util/widgets/crypto_service_grid.dart';
import 'package:dinissa/util/widgets/finance_service_grid.dart';
import 'package:dinissa/util/widgets/more_service_grid.dart';
import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          // title: const Text('Services'),
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Finance '),
              Tab(text: 'Crypto'),
              // Tab(text: 'Bill Payment'),
              Tab(text: 'More'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FinanceServicesGrid(),
            CryptoServicesGrid(),
            MoreServicesGrid()
          ],
        ),
      ),
    );
  }
}

import 'package:dinissa/util/widgets/crypto_service_grid.dart';
import 'package:dinissa/util/widgets/finance_service_grid.dart';
import 'package:dinissa/util/widgets/more_service_grid.dart';
import 'package:dinissa/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/usable_clickable_widget.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: UsableClickWidget(
                onClick: () =>{
                  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>
                    const DashboardScreen()
                  ))
                }, //() => Navigator.pop(context),
                child: Image.asset(
                    'assets/images/ic_back.png',
                    width: 30.0,
                    height: 30.0
                ),
              )
          ),
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.surface,
          automaticallyImplyLeading: false,
          // backgroundColor: AppColors.primaryColor,
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

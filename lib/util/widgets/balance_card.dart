import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/balance_Controller.dart';
import '../app_colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final BalanceController balanceController = Get.find(); // Find the BalanceController
    dynamic open = false;

    return SizedBox(
      height: 150.0, // Adjust the height as necessary
      child: Obx(() {
        final balances = balanceController.getBalances();
        return ListView(
          scrollDirection: Axis.horizontal,
          children: balances.entries.map((entry) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFfebd59),
                    Color(0xFFff8465),
                    Color(0xFFe75586),
                    Color(0xFFa347a4),
                    Color(0xFF004aac),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hi, Rick!",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          entry.key == "Balance" ? "Wallet Balance" : "Crypto Balance",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    balanceController.getBalanceVisibility()
                                        ? entry.value
                                        : '*********',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      balanceController.getBalanceVisibility()
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      balanceController.toggleBalanceVisibility();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryTintColor100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () => print('Fund added'),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.primaryTintColor600,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Add Funds",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AppColors.primaryTintColor600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import '../app_colors.dart';

class BalanceCard extends StatefulWidget {
  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool isBalanceVisible = true;

  final balances = {
    "Balance": "₦205,000.00",
    "Crypto": "₦123,300.00"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0, // Adjust the height as necessary
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: balances.entries.map((entry) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFfebd59), // #febd59
                  Color(0xFFff8465), // #ff8465
                  Color(0xFFe75586), // #e75586
                  Color(0xFFa347a4), // #a347a4
                  Color(0xFF004aac), // #004aac
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
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  isBalanceVisible ? entry.value : '*********',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    isBalanceVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isBalanceVisible = !isBalanceVisible;
                                    });
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
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => {
                        print('Fund added')
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.primaryTintColor600,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Add Funds",
                            style: TextStyle(
                              fontSize: 16.0,
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
      ),
    );
  }
}

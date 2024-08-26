import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/transactions/transaction_controller.dart';
import '../../widgets/custom_back_button.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionController _transactionController = Get.put(TransactionController());

   TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History'),
        leading: customBackButton(context: context),
      ),
      body: Obx(() {
        if (_transactionController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            // Filters
            DropdownButton<String>(
              value: _transactionController.selectedFilter.value.isEmpty
                  ? null
                  : _transactionController.selectedFilter.value,
              items: ['Date', 'Type']
                  .map((filter) => DropdownMenuItem(
                value: filter,
                child: Text('Filter by $filter'),
              ))
                  .toList(),
              onChanged: (value) {
                _transactionController.filterTransactions(value!);
              },
              hint: const Text('Filter Transactions'),
            ),
            // Transaction List
            Expanded(
              child: ListView.builder(
                itemCount: _transactionController.transactionList.length,
                itemBuilder: (context, index) {
                  final transaction = _transactionController.transactionList[index];
                  final isPositive = transaction['amount'] > 0;
                  final amountText = isPositive
                      ? '+₦${transaction['amount']}'
                      : '-₦${transaction['amount'].abs()}';
                  final amountColor = isPositive ? Colors.green : Colors.red;

                  return Container(
                    constraints: const BoxConstraints(maxWidth: 358),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(224, 232, 242, 0.6),
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/img.png',
                            width: 52,
                            height: 52,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['description'] ?? 'No Description',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF26273A),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  transaction['details'] ?? 'No Details',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF26273A),
                                  ),
                                ),
                                const SizedBox(height: 8),
                             Visibility(
                                 visible: false,
                                 child:  Row(
                               children: [
                                 const Text(
                                   'Transaction ID',
                                   style: TextStyle(
                                     fontSize: 12,
                                     color: Color(0x9926273A),
                                   ),
                                 ),
                                 const SizedBox(width: 10,),
                                 Text(
                                   transaction['id'].toString() ?? 'Unknown ID',
                                   style: const TextStyle(
                                     fontSize: 12,
                                     color: Color(0xFF26273A),
                                   ),
                                 ),
                               ],
                             ))
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                amountText,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: amountColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0x3300FF94),
                                ),
                                child: Text(
                                  transaction['status'] ?? 'Unknown Status',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF5DC486),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                transaction['date'] ?? 'Unknown Date',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0x9926273A),
                                ),
                              ),
                              Text(
                                transaction['time'] ?? 'Unknown Time',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0x9926273A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

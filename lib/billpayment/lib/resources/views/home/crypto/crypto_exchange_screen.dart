import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/http/controllers/crypto_controller.dart';
// import 'crypto_controller.dart';

class CryptoExchangeScreen extends StatelessWidget {
  final CryptoController controller = Get.put(CryptoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Exchange')),
      body: Column(
        children: [
          Obx(() => Text("Available Balance: ₦${controller.availableBalance.value}")),
          ElevatedButton(onPressed: () =>  print('deposite'),//Get.to(() => DepositScreen()),
              child: Text("Deposit")),
          ElevatedButton(onPressed: () =>  print('withdraw'),//Get.to(() => WithdrawScreen()),
              child: Text("Withdraw")),
          // Display coins list
          Expanded(
            child: ListView.builder(
              itemCount: controller.coins.length,
              itemBuilder: (context, index) {
                final coin = controller.coins[index];
                return ListTile(
                  title: Text("${coin['name']}"),
                  subtitle: Text("₦${coin['price']}"),
                  trailing: Text("${coin['amount']}"),
                  onTap: () {
                    controller.setSelectedCoin("${coin['name']}");
                    // Get.to(() => ExchangeScreen());  // Navigate to exchange screen
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

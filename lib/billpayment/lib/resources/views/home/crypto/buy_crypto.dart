import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Ensure this package is installed

import '../../../../app/http/controllers/crypto_controller.dart';

class BuyCryptoScreen extends StatefulWidget {
   final CryptoController controller;
  const BuyCryptoScreen({super.key, required this.controller});

  @override
  State<BuyCryptoScreen> createState() => BuyCryptoScreenState();

}


class BuyCryptoScreenState extends State<BuyCryptoScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trade Crypto',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        // backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Crypto Currency', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            // Dropdown for crypto selection
            Obx(() => DropdownButton<String>(
              value: widget.controller.selectedCrypto.value,
              onChanged: (value) {
                if (value != null) {
                  widget.controller.selectCrypto(value);
                }
              },
              items: widget.controller.cryptoList
                  .map((crypto) => DropdownMenuItem<String>(
                value: crypto['name'],
                child: Text(crypto['name']),
              ))
                  .toList(),
            )),
           const SizedBox(height: 20),
            // Amount Input
            const Text('Enter Amount:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                widget.controller.calculateCryptoAmount(ngnAmount: double.tryParse(value) ?? 0);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixText: 'NGN',
              ),
            ),
            const SizedBox(height: 20),
            // Wallet Address and QR Code
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.controller.walletAddress.value, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                // Correctly use QrImage
                QrImageView(
                  data: widget.controller.walletAddress.value,  // Pass the wallet address to generate the QR code
                  size: 150.0,
                  version: QrVersions.auto, // Optional
                ),
              ],
            )),
            const SizedBox(height: 20),
            // Crypto Details Review
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rate: ${widget.controller.cryptoRate.value}'),
                Text('Amount: ${widget.controller.cryptoAmount.value.toStringAsFixed(6)}'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Proceed to payment
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Proceed to Payment'),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }


}

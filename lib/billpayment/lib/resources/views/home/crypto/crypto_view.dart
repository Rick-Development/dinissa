import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:billvaoit/app/http/controllers/crypto_controller.dart';
import 'package:billvaoit/resources/views/home/crypto/sell_crypto.dart';
import 'package:get_storage/get_storage.dart';
import '../../../widgets/usable_dashboard_slider.dart';
import 'deposit/deposit_coin.dart';
import 'dart:math';

class CryptoView extends StatefulWidget {
  const CryptoView({super.key});

  @override
  State<CryptoView> createState() => CryptoViewState();
}

class CryptoViewState extends State<CryptoView> {
  late CryptoController cryptoController;
  bool viewDetails = true;
  final random_num = Random(2);
  GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    cryptoController = Get.put(CryptoController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Gap(MediaQuery.of(context).padding.top + 24),
              InkWell(
                onTap: Navigator.of(context).pop,
                splashColor: Colors.transparent,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    const Gap(24),
                    Text(
                      'Crypto',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(52),
              const UsableDashboardSlider(imagePaths: [
                'assets/images/img_3.png',
                'assets/images/dash_image.png',
                'assets/images/img_2.png',
              ]),
              const Gap(14),
              Text(
                'Click any coin to start trading',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Gap(28),

              // Removing nested SingleChildScrollView, this column will scroll
              Column(
                children: cryptoController.cryptoList.map((crypto) {
                  // Each `crypto` is a Map<String, dynamic>
                  String key = crypto.keys.first;
                  String _symbol = crypto.keys.last; // Assuming each map has only one key-value pair
                  dynamic value = crypto[key];
                  dynamic symbol = crypto[_symbol];

                  // Generate random percentage between -50% and +50%
                  double randomPercent = (random_num.nextDouble() * 100) - 50;
                  String percent = "${randomPercent.toStringAsFixed(2)}%";

                  // Customize the Row widget as needed
                  return InkWell(
                    onTap: () {
                      storage.write('sell_crypto', {
                        'name': value,
                        'short_name': symbol,
                        'address': crypto['address']
                      });
                      Get.to(SellCryptoScreen());
                    },
                    child: Column(
                      children: [
                        const Gap(10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: assetWidget(
                            context,
                            decrease: percent.startsWith('-') ? true : false,
                            percent: percent,
                            assetName: value,
                            amount: '0.0000 ${symbol.toUpperCase()}',
                            nairaAmount: '\$0.00',
                            img: symbol.toLowerCase(),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const Gap(20), // Add gap to ensure there is space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
